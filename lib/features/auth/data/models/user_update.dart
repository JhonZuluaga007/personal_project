import 'dart:convert';

import 'package:personal_project/features/auth/domain/entities/user_update_entity.dart';

class UserUpdateModel extends UserUpdateEntity{
    UserUpdateModel({
      required String address,
      required String city,
      required String state,
      required String zip,
      required String race,
      required String ethnicity,
      required String sex,
      required String gender,
    }) : super(
      address: address, 
      city: city, 
      state: state, 
      zip: zip, 
      race: race, 
      ethnicity: ethnicity, 
      sex: sex, 
      gender: gender
    );

    factory UserUpdateModel.fromJson(String str) => UserUpdateModel.fromMap(json.decode(str));

    factory UserUpdateModel.fromMap(Map<String, dynamic> json) => UserUpdateModel(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        race: json["race"],
        ethnicity: json["ethnicity"],
        sex: json["sex"],
        gender: json["gender"],
    );

}
