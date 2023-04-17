import '../../domain/entities/options_tools_entity.dart';
import '../../../test_history/domain/entities/test_history_entity.dart';

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
    // required this.description,
    // required this.disease,
    required this.isActive,
    required this.logo,
    required this.project,
    required this.type,
    required this.url,
  });

  final IdEntity id;
  // final DescriptionEntity description;
  // final List<dynamic> disease;
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
    required this.schoolLevels,
    required this.sex,
  });

  final IdEntity id;
  final bool acceptsTerms;
  final AddressEntity address;
  final String cellphone;
  final String dateOfBirth;
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
  final List<IdTestEntity> projects;
  final List<RaceEntity> race;
  final List<String> roles;
  final List<SchoolLevelsEntity> schoolLevels;
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
  final List<StateEntity> state;
  final String zip;
}

class SchoolLevelsEntity {
  SchoolLevelsEntity({
    required this.id,
    required this.level,
    required this.order,
    required this.project,
  });

  final IdTestEntity id;
  final String level;
  final int? order;
  final IdTestEntity? project;
}

class DateOfBirthEntity {
  DateOfBirthEntity({
    required this.date,
  });

  final DateTime date;
}

class EthnicityEntity extends OpEthnicityEntity {
  EthnicityEntity({
    required IdTestEntity id,
    required String ethnicity,
  }) : super(id: id.oid, ethnicity: ethnicity);
}

class StateEntity extends OpStatesEntity {
  StateEntity({
    required IdTestEntity id,
    required String state,
  }) : super(id: id.oid, states: state);
}

class GenderEntity extends OpGenderEntity {
  GenderEntity({
    required IdTestEntity id,
    required String gender,
  }) : super(id: id.oid, gender: gender);
}

class RaceEntity extends OpRaceEntity {
  RaceEntity({
    required IdTestEntity id,
    required String race,
  }) : super(id: id.oid, race: race);
}

class SexEntity extends OpSexEntity {
  SexEntity({
    required IdTestEntity id,
    required String sex,
  }) : super(id: id.oid, sex: sex);
}

class MessageEntity {
  MessageEntity({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;
}
