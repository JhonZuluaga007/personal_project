// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromMap(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.project,
    required this.statusCode,
    required this.token,
    required this.user,
  });

  String project;
  int statusCode;
  String token;
  User user;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        project: json["project"] ?? '',
        statusCode: json["statusCode"],
        token: json["token"] ?? '',
        user: User.fromMap(json["user"] ?? json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "project": project,
        "statusCode": statusCode,
        "token": token,
        "user": user.toMap(),
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
    // required this.ethnicity,
    required this.firstLogin,
    // required this.gender,
    required this.informationUpdated,
    required this.isActive,
    required this.isConfirmed,
    required this.lastname,
    required this.loginId,
    required this.middleName,
    required this.name,
    // required this.organization,
    required this.participantId,
    required this.password,
    required this.passwordReset,
    required this.projects,
    // required this.race,
    // required this.roles,
    // required this.sex,
    required this.updated,
  });

  String id;
  bool acceptsTerms;
  Addresses addresses;
  Cellphone cellphone;
  String dateOfBirth;
  String email;
  // Ethnicity ethnicity;
  bool firstLogin;
  // Ethnicity gender;
  bool informationUpdated;
  bool isActive;
  bool isConfirmed;
  String lastname;
  String loginId;
  Cellphone middleName;
  String name;
  // Ethnicity organization;
  Cellphone participantId;
  String password;
  bool passwordReset;
  List<dynamic> projects;
  // Ethnicity race;
  // List<Ethnicity> roles;
  // Ethnicity sex;
  Updated updated;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        acceptsTerms: json["accepts_terms"],
        addresses: Addresses.fromMap(json["addresses"]),
        cellphone: Cellphone.fromMap(json["cellphone"]),
        dateOfBirth: json["date_of_birth"],
        email: json["email"],
        // ethnicity: Ethnicity.fromMap(json["ethnicity"]),
        firstLogin: json["first_login"],
        // gender: Ethnicity.fromMap(json["gender"]),
        informationUpdated: json["information_updated"],
        isActive: json["is_active"],
        isConfirmed: json["is_confirmed"],
        lastname: json["lastname"],
        loginId: json["login_id"],
        middleName: Cellphone.fromMap(json["middle_name"]),
        name: json["name"],
        // organization: Ethnicity.fromMap(json["organization"]),
        participantId: Cellphone.fromMap(json["participant_id"]),
        password: json["password"],
        passwordReset: json["password_reset"],
        projects: List<dynamic>.from(json["projects"].map((x) => x)),
        // race: Ethnicity.fromMap(json["race"]),
        // roles: List<Ethnicity>.from(
        //     json["roles"].map((x) => Ethnicity.fromMap(x))),
        // sex: Ethnicity.fromMap(json["sex"]),
        updated: Updated.fromMap(json["updated"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "accepts_terms": acceptsTerms,
        "addresses": addresses.toMap(),
        "cellphone": cellphone.toMap(),
        "date_of_birth": dateOfBirth,
        "email": email,
        // "ethnicity": ethnicity.toMap(),
        "first_login": firstLogin,
        // "gender": gender.toMap(),
        "information_updated": informationUpdated,
        "is_active": isActive,
        "is_confirmed": isConfirmed,
        "lastname": lastname,
        "login_id": loginId,
        "middle_name": middleName.toMap(),
        "name": name,
        // "organization": organization.toMap(),
        "participant_id": participantId.toMap(),
        "password": password,
        "password_reset": passwordReset,
        "projects": List<dynamic>.from(projects.map((x) => x)),
        // "race": race.toMap(),
        // "roles": List<dynamic>.from(roles.map((x) => x.toMap())),
        // "sex": sex.toMap(),
        "updated": updated.toMap(),
      };
}

class Addresses {
  Addresses({
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
  });

  String address;
  String city;
  String state;
  String zip;

  factory Addresses.fromJson(String str) => Addresses.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

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

class Cellphone {
  Cellphone({
    required this.numberDouble,
  });

  String numberDouble;

  factory Cellphone.fromJson(String str) => Cellphone.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cellphone.fromMap(Map<String, dynamic> json) => Cellphone(
        numberDouble: json["\u0024numberDouble"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024numberDouble": numberDouble,
      };
}

class Ethnicity {
  Ethnicity({
    required this.oid,
  });

  String oid;

  factory Ethnicity.fromJson(String str) => Ethnicity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ethnicity.fromMap(Map<String, dynamic> json) => Ethnicity(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024oid": oid,
      };
}

class Updated {
  Updated({
    required this.date,
  });

  DateTime date;

  factory Updated.fromJson(String str) => Updated.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Updated.fromMap(Map<String, dynamic> json) => Updated(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024date": date.toIso8601String(),
      };
}
