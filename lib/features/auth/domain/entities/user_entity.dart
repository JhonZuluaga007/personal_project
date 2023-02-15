import 'package:personal_project/features/auth/data/models/user_model.dart';

class UserEntity {
  UserEntity({
    required this.statusCode,
    required this.token,
    required this.user,
  });

  final int? statusCode;
  final String? token;
  final UserData user;
}

class UserData {
  UserData(
      {required this.id,
      required this.acceptsTerms,
      required this.addresses,
      required this.cellphone,
      required this.dateOfBirth,
      required this.email,
      required this.ethnicity,
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
      required this.firstLogin,
      //required this.updated,
      required this.levelSchool});

  final String id;
  final bool? acceptsTerms;
  final AddressesEntity? addresses;
  final String? cellphone;
  final DateOfBirth? dateOfBirth;
  final String? email;
  final List<EthnicityEntity?>? ethnicity;
  final List<GenderEntity?>? gender;
  final String? image;
  final bool? informationUpdated;
  final bool? isActive;
  final bool? isConfirmed;
  final bool? firstLogin;
  final String? lastname;
  final String? loginId;
  final String? middleName;
  final String? name;
  final dynamic organization;
  final String? participantId;
  final String? password;
  final bool? passwordReset;
  final List<dynamic>? projects;
  final List<RaceEntity?>? race;
  final RolesEntity? roles;
  final List<SexEntity?>? sex;
  //final DateOfBirthEntity? updated;
  final String? levelSchool;
}

class AddressesEntity {
  AddressesEntity({
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
  });

  final String? address;
  final String? city;
  final String? state;
  final String? zip;
}

class DateOfBirthEntity {
  DateOfBirthEntity({
    required this.date,
  });

  final DateTime? date;
}

class DateEntity {
  DateEntity({
    required this.date,
  });

  final Date? date;
}

class NumberLongEntity {
  NumberLongEntity({
    required this.date,
  });

  final NumberLongEntity? date;
}

class EthnicityEntity {
  EthnicityEntity({
    required this.id,
    required this.ethnicity,
  });

  final String? id;
  final String? ethnicity;
}

class GenderEntity {
  GenderEntity({
    required this.id,
    required this.gender,
  });

  final String? id;
  final String? gender;
}

class RaceEntity {
  RaceEntity({
    required this.id,
    required this.race,
  });

  final String? id;
  final String? race;
}

class RolesEntity {
  RolesEntity({
    required this.id,
    required this.role,
  });

  final String? id;
  final String? role;
}

class SexEntity {
  SexEntity({
    required this.id,
    required this.sex,
  });

  final String? id;
  final String? sex;
}
