import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import '../../../../config/helpers/api.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../domain/entities/user_update_entity.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_error.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class AuthDataSource {
  Future<UserModel> login(String username, String password) async {
    final response = await Api.post(Endpoints.login, {
      "email": username,
      "password": password,
    });
    if (response["statusCode"] == 200) {
      UserModelLogin userResponse = UserModelLogin.fromMap(response);
      debugPrint("result data response login: ${userResponse.user.id}");

      return getUser(userResponse.user.id, userResponse.token);
    } else {
      throw InvalidData(
        ServerError.fromMap(response).errorMessage,
      );
    }
  }

  Future<UserModel> getUser(String userId, String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Basic', token);
    final response = await Api.get('${Endpoints.getUser}$userId');
    UserModel userModel = UserModel.fromMap(response);
    //debugPrint("result data response getUser: ${userModel.user.image}");
    return userModel;
  }

  Future<ServerValidate> userUpdateEntity(
      UserUpdateEntity userUpdateEntity) async {
    final response =
        await Api.put(Endpoints.getUser + userUpdateEntity.userdId!, {
      'address': userUpdateEntity.address!,
      'city': userUpdateEntity.city!,
      'state': userUpdateEntity.state!,
      'zip': userUpdateEntity.zip!,
      'race': userUpdateEntity.race!,
      'ethnicity': userUpdateEntity.ethnicity!,
      'sex': userUpdateEntity.sex!,
      'gender': userUpdateEntity.gender!,
    });

    if (response["statusCode"] == 200) {
      return ServerValidate(message: "Changes saved", statusCode: 200);
    } else {
      throw InvalidData("Could not save changes");
    }
  }

  Future<ServerValidate> resetPassword(String email) async {
    final response = await Api.post(
      Endpoints.resetPassword,
      {
        "email": email,
      },
    );
    if (response["statusCode"] == 200) {
      return ServerValidate(message: "Password sent to email", statusCode: 200);
    } else {
      throw InvalidData("Could not save changes");
    }
  }

  Future<ServerValidate> changePassword(
      ChangePasswordEntity changePassword) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY3NTgyOTc5NiwianRpIjoiY2Q0ZjRkNDAtZjk3Zi00N2FlLTllZjUtZTJiYjI5M2FlNGYxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6InNhbGJpc3NlckBib25uZXR0YW5hbHl0aWNzLmNvbSIsIm5iZiI6MTY3NTgyOTc5NiwiZXhwIjoxNjc1OTE2MTk2fQ.n5tEuDiS9bPrT5gO41IsyFHBy9bQAu_BC-F1MkqWbzg'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.changePassword));
    request.fields.addAll(
      {
        'userId': changePassword.userId,
        'pass': changePassword.pass,
        'newpass': changePassword.newpass
      },
    );

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);
      bool success = false;
      if (decodedMap['statusCode'] == 200) {
        success = true;
      }
      return success
          ? ServerValidate(message: "Password reset", statusCode: 200)
          : throw InvalidData(
              "We could not update your password. Make sure your current password is correct");
    } else {
      throw InvalidData(
          "We could not update your password. Make sure your current password is correct");
    }

    /*final response = await Api.post(
      Endpoints.changePassword,
      {
        'userId': changePassword.userId,
        'pass': changePassword.pass,
        'newpass': changePassword.newpass
      },
    );
    if (response["statusCode"] == 200) {
      return ServerValidate(message: "Password reset", statusCode: 200);
    } else {
      throw InvalidData(
          "We could not update your password. Make sure your current password is correct");
    }*/
  }
}
