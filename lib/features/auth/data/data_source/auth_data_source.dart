import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/features/auth/data/models/user_model.dart';

class AuthDataSource {
  Future<UserModel> login(String username, String password) async {
    final response = await Api.post(
        Endpoints.login, {"email": username, "password": password});
    UserModel aaa = userModelFromJson(response);
    debugPrint("result data response: $aaa");
    return UserModel.fromJson(aaa.toJson());
  }

  Future<UserModel> getUser(String userId) async {
    final response =
        await Api.get('${Endpoints.getUser}63a39216bd99fc7c1ecad8de');
    UserModel aaa = userModelFromJson(response);

    debugPrint("result data response: $aaa");
    return UserModel.fromJson(aaa.toJson());
  }
}
