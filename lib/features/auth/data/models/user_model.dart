// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));
UserModelLogin userModelLoginFromMap(String str) =>
    UserModelLogin.fromMap(json.decode(str));

String userModelToMap(UserModel? data) => json.encode(data!.toMap());

class UserModelLogin {
  UserModelLogin({
    required this.project,
    required this.statusCode,
    required this.token,
    required this.user,
  });

  String? project;
  int? statusCode;
  String? token;
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

class UserModel {
  UserModel({
    required this.project,
    required this.statusCode,
    required this.token,
    required this.user,
  });

  String? project;
  int? statusCode;
  String? token;
  User user;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        project: json["project"],
        statusCode: json["statusCode"],
        token: json["token"],
        user: User.fromMap(json["user"] ?? json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "project": project,
        "statusCode": statusCode,
        "token": token,
        "user": user.toMap(),
      };
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

class User {
  User({
    required this.id,
    required this.acceptsTerms,
    required this.addresses,
    required this.cellphone,
    required this.dateOfBirth,
    required this.email,
    required this.ethnicity,
    required this.firstLogin,
    required this.gender,
    required this.image,
    required this.informationUpdated,
    required this.isActive,
    required this.isConfirmed,
    required this.lastname,
    required this.loginId,
    required this.middleName,
    required this.name,
    required this.organization,
    required this.participantId,
    required this.password,
    required this.passwordReset,
    required this.projects,
    required this.race,
    required this.roles,
    required this.sex,
    required this.updated,
  });

  String id;
  bool? acceptsTerms;
  Addresses? addresses;
  String? cellphone;
  DateOfBirth? dateOfBirth;
  String? email;
  List<Ethnicity?>? ethnicity;
  bool? firstLogin;
  List<Gender?>? gender;
  String? image;
  bool? informationUpdated;
  bool? isActive;
  bool? isConfirmed;
  String? lastname;
  String? loginId;
  String? middleName;
  String? name;
  dynamic organization;
  String? participantId;
  String? password;
  bool? passwordReset;
  List<dynamic>? projects;
  List<Race?>? race;
  Roles? roles;
  List<Sex?>? sex;
  DateOfBirth? updated;

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
        firstLogin: json["first_login"],
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
        projects: json["projects"] == null
            ? []
            : List<dynamic>.from(json["projects"]!.map((x) => x)),
        race: json["race"] == null
            ? []
            : List<Race?>.from(json["race"]!.map((x) => Race.fromMap(x))),
        roles: Roles.fromMap(json["roles"]),
        sex: json["sex"] == null
            ? []
            : List<Sex?>.from(json["sex"]!.map((x) => Sex.fromMap(x))),
        updated: DateOfBirth.fromMap(json["updated"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "accepts_terms": acceptsTerms,
        "addresses": addresses!.toMap(),
        "cellphone": cellphone,
        "date_of_birth": dateOfBirth!.toMap(),
        "email": email,
        "ethnicity": ethnicity == null
            ? []
            : List<dynamic>.from(ethnicity!.map((x) => x!.toMap())),
        "first_login": firstLogin,
        "gender": gender == null
            ? []
            : List<dynamic>.from(gender!.map((x) => x!.toMap())),
        "image": image,
        "information_updated": informationUpdated,
        "is_active": isActive,
        "is_confirmed": isConfirmed,
        "lastname": lastname,
        "login_id": loginId,
        "middle_name": middleName,
        "name": name,
        "organization": organization,
        "participant_id": participantId,
        "password": password,
        "password_reset": passwordReset,
        "projects":
            projects == null ? [] : List<dynamic>.from(projects!.map((x) => x)),
        "race": race == null
            ? []
            : List<dynamic>.from(race!.map((x) => x!.toMap())),
        "roles": roles!.toMap(),
        "sex":
            sex == null ? [] : List<dynamic>.from(sex!.map((x) => x!.toMap())),
        "updated": updated!.toMap(),
      };
}

class Addresses {
  Addresses({
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
  });

  String? address;
  String? city;
  String? state;
  String? zip;

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

class DateOfBirth {
  DateOfBirth({
    required this.date,
  });

  DateTime? date;

  factory DateOfBirth.fromMap(Map<String, dynamic> json) => DateOfBirth(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024date": date?.toIso8601String(),
      };
}

class Ethnicity {
  Ethnicity({
    required this.id,
    required this.ethnicity,
  });

  String? id;
  String? ethnicity;

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

class Gender {
  Gender({
    required this.id,
    required this.gender,
  });

  String? id;
  String? gender;

  factory Gender.fromMap(Map<String, dynamic> json) => Gender(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "gender": gender,
      };
}

class Race {
  Race({
    required this.id,
    required this.race,
  });

  String? id;
  String? race;

  factory Race.fromMap(Map<String, dynamic> json) => Race(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        race: json["race"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "race": race,
      };
}

class Roles {
  Roles({
    required this.id,
    required this.role,
  });

  String? id;
  String? role;

  factory Roles.fromMap(Map<String, dynamic> json) => Roles(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "role": role,
      };
}

class Sex {
  Sex({
    required this.id,
    required this.sex,
  });

  String? id;
  String? sex;

  factory Sex.fromMap(Map<String, dynamic> json) => Sex(
        id: json["_id"] == Map ? Id.fromMap(json["_id"]).oid : json["_id"],
        sex: json["sex"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "sex": sex,
      };
}
