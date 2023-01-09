import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/features/auth/data/models/user_model.dart';

class AuthDataSource {
  Future<UserModelLogin> login(String username, String password) async {
    final response = await Api.post(
        Endpoints.login, {"email": username, "password": password});
    UserModelLogin aaa = userModelLoginFromMap(response);
    debugPrint("result data response login: ${aaa.user.id}");
    return userModelLoginFromMap(response);
  }

  Future<UserModel> getUser(String userId) async {
    final response = await Api.get('${Endpoints.getUser}$userId');
    UserModel aaa = userModelFromMap(response);
    debugPrint("result data response: ${aaa.user.id}");
    return userModelFromMap(response);
  }
}
