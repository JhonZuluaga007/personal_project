import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/config/helpers/models/server_error.dart';
import 'package:personal_project/features/auth/data/models/user_model.dart';

class AuthDataSource {
  Future<UserModel> login(String username, String password) async {
    final response = await Api.post(
      Endpoints.login, {
        "email": username, 
        "password": password,
        }
      );
    if(response["statusCode"] == 200){
      // UserModelLogin userResponse = userModelLoginFromMap(response);
      // debugPrint("result data response login: ${userResponse.user.id}");
      return UserModel.fromMap(response);
    }
    else{
      throw InvalidData(
        ServerError.fromMap(response).errorMessage,
      );
    }
  }

  Future<UserModel> getUser(String userId) async {
    final response = await Api.get('${Endpoints.getUser}$userId');
    UserModel aaa = userModelFromMap(response);
    debugPrint("result data response getUser: ${aaa.user.id}");
    return userModelFromMap(response);
  }
}
