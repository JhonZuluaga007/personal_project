import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.project,
    required this.token,
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final String project;
  final String token;
  final Data data;
  final String message;
  final int statusCode;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        project: json["project"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "token": token,
        "data": data.toJson(),
        "message": message,
        "statusCode": statusCode,
      };
}

class Data {
  Data({
    required this.id,
    required this.acceptsTerms,
    required this.addresses,
    required this.cellphone,
    required this.dateOfBirth,
    required this.email,
    required this.ethnicity,
    required this.firstLogin,
    required this.gender,
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

  final String id;
  final bool acceptsTerms;
  final Addresses addresses;
  final String cellphone;
  final DateOfBirth dateOfBirth;
  final String email;
  final List<Ethnicity> ethnicity;
  final bool firstLogin;
  final List<Gender> gender;
  final bool informationUpdated;
  final bool isActive;
  final bool isConfirmed;
  final String lastname;
  final String loginId;
  final String middleName;
  final String name;
  final dynamic organization;
  final String participantId;
  final String password;
  final bool passwordReset;
  final List<dynamic> projects;
  final List<Race> race;
  final Roles roles;
  final List<Sex> sex;
  final DateOfBirth updated;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        acceptsTerms: json["accepts_terms"],
        addresses: Addresses.fromJson(json["addresses"]),
        cellphone: json["cellphone"],
        dateOfBirth: DateOfBirth.fromJson(json["date_of_birth"]),
        email: json["email"],
        ethnicity: List<Ethnicity>.from(
            json["ethnicity"].map((x) => Ethnicity.fromJson(x))),
        firstLogin: json["first_login"],
        gender:
            List<Gender>.from(json["gender"].map((x) => Gender.fromJson(x))),
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
        projects: List<dynamic>.from(json["projects"].map((x) => x)),
        race: List<Race>.from(json["race"].map((x) => Race.fromJson(x))),
        roles: Roles.fromJson(json["roles"]),
        sex: List<Sex>.from(json["sex"].map((x) => Sex.fromJson(x))),
        updated: DateOfBirth.fromJson(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "accepts_terms": acceptsTerms,
        "addresses": addresses.toJson(),
        "cellphone": cellphone,
        "date_of_birth": dateOfBirth.toJson(),
        "email": email,
        "ethnicity": List<dynamic>.from(ethnicity.map((x) => x.toJson())),
        "first_login": firstLogin,
        "gender": List<dynamic>.from(gender.map((x) => x.toJson())),
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
        "projects": List<dynamic>.from(projects.map((x) => x)),
        "race": List<dynamic>.from(race.map((x) => x.toJson())),
        "roles": roles.toJson(),
        "sex": List<dynamic>.from(sex.map((x) => x.toJson())),
        "updated": updated.toJson(),
      };
}

class Addresses {
  Addresses({
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
  });

  final String address;
  final String city;
  final String state;
  final String zip;

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
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

  final DateTime date;

  factory DateOfBirth.fromJson(Map<String, dynamic> json) => DateOfBirth(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Ethnicity {
  Ethnicity({
    required this.id,
    required this.ethnicity,
  });

  final String id;
  final String ethnicity;

  factory Ethnicity.fromJson(Map<String, dynamic> json) => Ethnicity(
        id: json["_id"],
        ethnicity: json["ethnicity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ethnicity": ethnicity,
      };
}

class Gender {
  Gender({
    required this.id,
    required this.gender,
  });

  final String id;
  final String gender;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["_id"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "gender": gender,
      };
}

class Race {
  Race({
    required this.id,
    required this.race,
  });

  final String id;
  final String race;

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        id: json["_id"],
        race: json["race"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "race": race,
      };
}

class Roles {
  Roles({
    required this.id,
    required this.role,
  });

  final String id;
  final String role;

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: json["_id"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
      };
}

class Sex {
  Sex({
    required this.id,
    required this.sex,
  });

  final String id;
  final String sex;

  factory Sex.fromJson(Map<String, dynamic> json) => Sex(
        id: json["_id"],
        sex: json["sex"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sex": sex,
      };
}
