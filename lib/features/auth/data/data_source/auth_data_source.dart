import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final response = await Api.post(
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
    }
  }
}
