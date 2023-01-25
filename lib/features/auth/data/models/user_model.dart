// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

import 'package:personal_project/features/auth/domain/entities/user_entity.dart';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));
UserModelLogin userModelLoginFromMap(String str) =>
    UserModelLogin.fromMap(json.decode(str));

class UserModelLogin {
  UserModelLogin({
    required this.project,
    required this.statusCode,
    required this.token,
    required this.user,
  });

  String? project;
  int? statusCode;
  String token;
  UserLogin user;

  factory UserModelLogin.fromMap(Map<String, dynamic> json) => UserModelLogin(
        project: json["project"],
        statusCode: json["statusCode"],
        token: json["token"],
        user: UserLogin.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "project": project,
        "statusCode": statusCode,
        "token": token,
        "user": user.toMap(),
      };
}

class UserModel extends UserEntity {
  UserModel({
    required int statusCode,
    required String token,
    required User user,
  }) : super(
          statusCode: statusCode,
          token: token,
          user: user,
        );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        statusCode: json["statusCode"],
        token: json["token"] ?? "",
        user: User.fromMap(json["data"]),
      );
}

class UserLogin {
  UserLogin({
    required this.id,
  });

  String id;

  factory UserLogin.fromMap(Map<String, dynamic> json) => UserLogin(
        id: Id.fromMap(json["_id"]).oid!,
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
      };
}

class User extends UserData {
  User({
    required String id,
    required bool acceptsTerms,
    required Addresses addresses,
    required String cellphone,
    required DateOfBirth dateOfBirth,
    required String email,
    required List<Ethnicity?>? ethnicity,
    required List<Gender?>? gender,
    required String image,
    required bool informationUpdated,
    required bool isActive,
    required bool isConfirmed,
    required String lastname,
    required String loginId,
    required String middleName,
    required String name,
    required dynamic organization,
    required String participantId,
    required String password,
    required bool passwordReset,
    required List<String> projects,
    required List<Race?>? race,
    required Roles roles,
    required String levelSchool,
    required List<Sex?>? sex,
    required DateOfBirth updated,
  }) : super(
            id: id,
            acceptsTerms: acceptsTerms,
            addresses: addresses,
            cellphone: cellphone,
            dateOfBirth: dateOfBirth,
            email: email,
            ethnicity: ethnicity,
            gender: gender,
            image: image,
            informationUpdated: informationUpdated,
            isActive: isActive,
            isConfirmed: isConfirmed,
            lastname: lastname,
            loginId: loginId,
            middleName: middleName,
            name: name,
            organization: organization,
            participantId: participantId,
            password: password,
            passwordReset: passwordReset,
            projects: projects,
            race: race,
            roles: roles,
            sex: sex,
            levelSchool: levelSchool,
            updated: updated);

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        acceptsTerms: json["accepts_terms"],
        addresses: Addresses.fromMap(json["addresses"]),
        cellphone: json["cellphone"],
        dateOfBirth: DateOfBirth.fromMap(json["date_of_birth"]),
        email: json["email"],
        ethnicity: json["ethnicity"] == null
            ? []
            : List<Ethnicity?>.from(
                json["ethnicity"]!.map((x) => Ethnicity.fromMap(x))),
        gender: json["gender"] == null
            ? []
            : List<Gender?>.from(json["gender"]!.map((x) => Gender.fromMap(x))),
        image: json["image"],
        informationUpdated: json["information_updated"],
        isActive: json["is_active"],
        isConfirmed: json["is_confirmed"],
        lastname: json["lastname"],
        loginId: json["login_id"],
        middleName: json["middle_name"],
        name: json["name"],
        organization: json["organization"],
        participantId: json["participant_id"],
        password: json["password"],
        passwordReset: json["password_reset"],
        levelSchool: json["level_school"],
        projects: json["projects"] == null
            ? []
            : List<String>.from(json["projects"]!.map((x) => x)),
        race: json["race"] == null
            ? []
            : List<Race?>.from(json["race"]!.map((x) => Race.fromMap(x))),
        roles: Roles.fromMap(json["roles"]),
        sex: json["sex"] == null
            ? []
            : List<Sex?>.from(json["sex"]!.map((x) => Sex.fromMap(x))),
        updated: DateOfBirth.fromMap(json["updated"]),
      );
}

class Addresses extends AddressesEntity {
  Addresses({
    required String address,
    required String city,
    required String state,
    required String zip,
  }) : super(
          address: address,
          city: city,
          state: state,
          zip: zip,
        );

  factory Addresses.fromMap(Map<String, dynamic> json) => Addresses(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
      };
}

class DateOfBirth extends DateOfBirthEntity {
  DateOfBirth({
    required DateTime date,
  }) : super(date: date);

  factory DateOfBirth.fromMap(Map<String, dynamic> json) => DateOfBirth(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024date": date?.toIso8601String(),
      };
}

class Ethnicity extends EthnicityEntity {
  Ethnicity({
    required String id,
    required String ethnicity,
  }) : super(id: id, ethnicity: ethnicity);

  factory Ethnicity.fromMap(Map<String, dynamic> json) => Ethnicity(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        ethnicity: json["ethnicity"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "ethnicity": ethnicity,
      };
}

class Id {
  Id({
    this.oid,
  });

  String? oid;

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "\u0024oid": oid,
      };
}

class Gender extends GenderEntity {
  Gender({
    required String id,
    required String gender,
  }) : super(id: id, gender: gender);

  factory Gender.fromMap(Map<String, dynamic> json) => Gender(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "gender": gender,
      };
}

class Race extends RaceEntity {
  Race({
    required String id,
    required String race,
  }) : super(id: id, race: race);

  factory Race.fromMap(Map<String, dynamic> json) => Race(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        race: json["race"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "race": race,
      };
}

class Roles extends RolesEntity {
  Roles({
    required String id,
    required String role,
  }) : super(id: id, role: role);

  factory Roles.fromMap(Map<String, dynamic> json) => Roles(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "role": role,
      };
}

class Sex extends SexEntity {
  Sex({
    required String id,
    required String sex,
  }) : super(id: id, sex: sex);

  factory Sex.fromMap(Map<String, dynamic> json) => Sex(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        sex: json["sex"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "sex": sex,
      };
}
