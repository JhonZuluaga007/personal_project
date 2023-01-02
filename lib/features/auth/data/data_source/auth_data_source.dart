import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/features/auth/data/models/user_model.dart';

class AuthDataSource {
  Future<UserModel> login(String username, String password) async {
    final response = await Api.post(Endpoints.login, {
        "email": "mbonnett@bonnettanalytics.com",
        "password": "123456"
    });
    UserModel aaa = userModelFromJson(response);
    debugPrint("result data response: $aaa");
    return UserModel.fromJson(aaa.toJson());
  }
}
