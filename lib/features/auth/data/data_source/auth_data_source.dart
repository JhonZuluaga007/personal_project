import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/config/helpers/models/server_error.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';
import 'package:personal_project/features/auth/data/models/user_model.dart';
import 'package:personal_project/features/auth/domain/entities/user_update_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    debugPrint("result data response getUser: ${userModel.user.email}");
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
      //UserModelLogin userResponse = UserModelLogin.fromMap(response);
      //debugPrint("result data response login: ${userResponse.user.id}");

      return ServerValidate(message: "Changes saved", statusCode: 200);
    } else {
      throw InvalidData("Could not save changes");
    }
  }

  /*Future<ServerValidate> userUpdateEntity(
      UserUpdateEntity userUpdateEntity) async {
    Api.cleanHeaders();
    final responseUpdateUser = http.MultipartRequest(
        'PUT', Uri.parse('${Endpoints.getUser}${userUpdateEntity.userdId}'));
    responseUpdateUser.fields.addAll({
      'address': userUpdateEntity.address!,
      'city': userUpdateEntity.city!,
      'state': userUpdateEntity.state!,
      'zip': userUpdateEntity.zip!,
      'race': userUpdateEntity.race!,
      'ethnicity': userUpdateEntity.ethnicity!,
      'sex': userUpdateEntity.sex!,
      'gender': userUpdateEntity.gender!,
    });
    responseUpdateUser.files
        .add(await http.MultipartFile.fromPath('files', ''));

    http.StreamedResponse response = await responseUpdateUser.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      //return userUpdateEntity;
      return ServerValidate(message: "", statusCode: 200);
    } else {
      debugPrint(response.reasonPhrase);
      throw InvalidData("Could not save changes");
    }
  }*/
}
