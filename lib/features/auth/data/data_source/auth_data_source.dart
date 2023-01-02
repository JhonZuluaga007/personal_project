import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:personal_project/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  Future<UserModel> login(String username, String password) async {
    String bs64Auth =
        base64.encode(username.codeUnits + ':'.codeUnits + password.codeUnits);
    log(bs64Auth);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Basic', bs64Auth);
    final response = await Api.get(Endpoints.login);
    debugPrint("result data response: $response");
    return UserModel.fromJson(response);
  }
}
