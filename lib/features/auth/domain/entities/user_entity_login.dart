class UserEntityLogin {
  UserEntityLogin({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataEntity data;
  final MessageEntity message;
  final int statusCode;
}

class DataEntity {
  DataEntity({
    required this.project,
    required this.token,
    required this.user,
  });

  final ProjectEntity project;
  final String token;
  final UserEntity user;
}

class ProjectEntity {
  ProjectEntity({
    required this.id,
    required this.description,
    required this.disease,
    required this.isActive,
    required this.logo,
    required this.project,
    required this.type,
    required this.url,
  });

  final IdEntity id;
  final DescriptionEntity description;
  final List<String> disease;
  final bool isActive;
  final DescriptionEntity logo;
  final String project;
  final List<TypeEntity> type;
  final String url;
}

class DescriptionEntity {
  DescriptionEntity({
    required this.numberDouble,
  });

  final String numberDouble;
}

class IdEntity {
  IdEntity({
    required this.oid,
  });

  final String oid;
}

class TypeEntity {
  TypeEntity({
    required this.id,
    required this.type,
    required this.userRegistrationAvailable,
  });

  final IdEntity id;
  final String type;
  final bool userRegistrationAvailable;
}

class UserEntity {
  UserEntity({
    required this.id,
    required this.acceptsTerms,
    required this.address,
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
    required this.participantId,
    required this.password,
    required this.passwordReset,
    required this.profileImage,
    required this.projects,
    required this.race,
    required this.roles,
    required this.schoolLevel,
    required this.schoolLevels,
    required this.sex,
  });

  final IdEntity id;
  final bool acceptsTerms;
  final AddressEntity address;
  final String cellphone;
  final DateOfBirthEntity dateOfBirth;
  final String email;
  final List<EthnicityEntity> ethnicity;
  final bool firstLogin;
  final List<GenderEntity> gender;
  final bool informationUpdated;
  final bool isActive;
  final bool isConfirmed;
  final String lastname;
  final String loginId;
  final String middleName;
  final String name;
  final String participantId;
  final String password;
  final bool passwordReset;
  final String profileImage;
  final List<IdEntity> projects;
  final List<RaceEntity> race;
  final List<String> roles;
  final List<String> schoolLevel;
  final List<String> schoolLevels;
  final List<SexEntity> sex;
}

class AddressEntity {
  AddressEntity({
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
  });

  final String address;
  final String city;
  final String state;
  final String zip;
}

class DateOfBirthEntity {
  DateOfBirthEntity({
    required this.date,
  });

  final DateTime date;
}

class EthnicityEntity {
  EthnicityEntity({
    required this.id,
    required this.ethnicity,
  });

  final IdEntity id;
  final String ethnicity;
}

class GenderEntity {
  GenderEntity({
    required this.id,
    required this.gender,
  });

  final IdEntity id;
  final String gender;
}

class RaceEntity {
  RaceEntity({
    required this.id,
    required this.race,
  });

  final IdEntity id;
  final String race;
}

class SexEntity {
  SexEntity({
    required this.id,
    required this.sex,
  });

  final IdEntity id;
  final String sex;
}

class MessageEntity {
  MessageEntity({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;
}
