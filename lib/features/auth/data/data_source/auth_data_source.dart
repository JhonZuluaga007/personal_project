import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import '../models/options_tools_model.dart';
import '../../../../config/helpers/api.dart';
import '../models/change_password_model.dart';
import '../../../../config/helpers/endpoints.dart';
import '../../domain/entities/user_update_entity.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_error.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class AuthDataSource {
  Future<UserModelLogin> login(String username, String password) async {
    final response = await Api.post(Endpoints.login, {
      "email": username,
      "password": password,
      "project": "ChelseaProject",
    });
    if (response["statusCode"] == 200) {
      UserModelLogin userResponse = UserModelLogin.fromJson(response);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('Basic', userResponse.data.token);
      return userResponse;
    } else {
      throw InvalidData(
        ServerError.fromMap(response).errorMessage.text,
      );
    }
  }

  Future<UserModelLogin> getUser() async {
    final response = await Api.get(Endpoints.getUser);
    if (response["statusCode"] == 200) {
      UserModelLogin userResponse = UserModelLogin.fromJson(response);
      return userResponse;
    } else {
      throw InvalidData(
        ServerError.fromMap(response).errorMessage.text,
      );
    }
  }

  Future<UserModelLogin> userUpdateEntity(
      UserUpdateEntity userUpdateEntity) async {
    var response = await Api.put(Endpoints.editProfile, {
      "project": "ChelseaProject",
      "address": userUpdateEntity.address,
      "city": userUpdateEntity.city,
      "state": userUpdateEntity.state!.id,
      "zip": userUpdateEntity.zip,
      "gender": userUpdateEntity.gender!.id,
      "sex": userUpdateEntity.sex!.id,
      "ethnicity": userUpdateEntity.ethnicity!.id,
      "race": userUpdateEntity.race!.id,
      "school_level": userUpdateEntity.levelSchool!.id.oid,
      "profileImage": userUpdateEntity.profileImage
    });

    if (response["statusCode"] == 200) {
      return UserModelLogin.fromJson(response);
    } else {
      throw InvalidData(ServerError.fromJson(response).errorMessage.text);
    }
  }

  Future<ServerValidate> resetPassword(String email) async {
    Api.clearHeaders();
    Api.setHeaders();
    final response = await Api.post(
      Endpoints.resetPassword,
      {
        "email": email,
        "project": "ChelseaProject",
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
    final prefs = await SharedPreferences.getInstance();
    String bearerToken = prefs.getString('Basic')!;
    var headers = {'Authorization': 'Bearer $bearerToken'};
    var request =
        http.MultipartRequest('PUT', Uri.parse(Endpoints.changePassword));
    request.fields.addAll(
      {
        'project': 'ChelseaProject',
        'currentPassword': changePassword.pass,
        'newPassword': changePassword.newpass,
        'confirmPassword': changePassword.newpass
      },
    );

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final decodedMap = json.decode(responseString);
      ChangePasswordModel statusAnswer =
          ChangePasswordModel.fromJson(decodedMap);

      bool success = false;
      if (statusAnswer.message.type == 'success') {
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
  }

  Future<OptionsToolsModel> getTestools() async {
    final response = await Api.get(Endpoints.optionsTools);
    if (response["statusCode"] == 200) {
      OptionsToolsModel helperToolsModel = OptionsToolsModel.fromJson(response);
      return helperToolsModel;
    } else {
      throw InvalidData(
        ServerError.fromMap(response).errorMessage.text,
      );
    }
  }
}
