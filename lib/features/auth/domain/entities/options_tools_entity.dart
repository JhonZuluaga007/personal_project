class OptionsToolsEntity {
  OptionsToolsEntity({
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
    required this.ethnicities,
    required this.genders,
    required this.races,
    required this.riskFactors,
    required this.schoolLevels,
    required this.sexes,
    required this.symptoms,
    required this.testResults,
    required this.testStatus,
    required this.testTypes,
    required this.testValidities,
    required this.vaccines,
  });

  final List<OpEthnicityEntity> ethnicities;
  final List<OpGenderEntity> genders;
  final List<OpRaceEntity> races;
  final List<OpRiskFactorEntity> riskFactors;
  final List<OpSchoolLevelEntity> schoolLevels;
  final List<OpSexEntity> sexes;
  final List<OpSymptomEntity> symptoms;
  final List<OpTestResultEntity> testResults;
  final List<OpTestStatusEntity> testStatus;
  final List<OpTestTypeEntity> testTypes;
  final List<OpTestValidityEntity> testValidities;
  final List<OpVaccineEntity> vaccines;
}

class IdEntity {
  IdEntity({
    required this.oid,
  });

  final String oid;
}

abstract class OpDropdown {
  OpDropdown({
    required this.id,
    required this.valor,
  });
  final String id;
  final String valor;
}

class OpEthnicityEntity extends OpDropdown {
  OpEthnicityEntity({
    required String id,
    required String ethnicity,
  }) : super(id: id, valor: ethnicity);
}

class OpGenderEntity extends OpDropdown {
  OpGenderEntity({
    required String id,
    required String gender,
  }) : super(id: id, valor: gender);
}

class OpRaceEntity extends OpDropdown {
  OpRaceEntity({
    required String id,
    required String race,
  }) : super(id: id, valor: race);
}

class OpSexEntity extends OpDropdown {
  OpSexEntity({
    required String id,
    required String sex,
  }) : super(id: id, valor: sex);
}

class OpRiskFactorEntity extends OpDropdown {
  OpRiskFactorEntity({
    required String id,
    required IdEntity disease,
    required IdEntity project,
    required String riskFactor,
  }) : super(id: id, valor: riskFactor);
}

class OpSchoolLevelEntity extends OpDropdown {
  OpSchoolLevelEntity({
    required String id,
    required String level,
    required int order,
    required IdEntity project,
  }) : super(id: id, valor: level);
}

class OpSymptomEntity extends OpDropdown {
  OpSymptomEntity({
    required String id,
    required IdEntity project,
    required String symptom,
  }) : super(id: id, valor: symptom);
}

class OpTestResultEntity extends OpDropdown {
  OpTestResultEntity({
    required String id,
    required String result,
  }) : super(id: id, valor: result);
}

class OpTestStatusEntity extends OpDropdown {
  OpTestStatusEntity({
    required String id,
    required String status,
  }) : super(id: id, valor: status);
}

class OpTestTypeEntity extends OpDropdown {
  OpTestTypeEntity({
    required String id,
    required bool hasBandType,
    required bool hasGeneCycle,
    required String testLetter,
    required String type,
  }) : super(id: id, valor: type);
}

class OpTestValidityEntity extends OpDropdown {
  OpTestValidityEntity({
    required String id,
    required String validity,
  }) : super(id: id, valor: validity);
}

class OpVaccineEntity extends OpDropdown {
  OpVaccineEntity({
    required String id,
    required IdEntity project,
    required String vaccine,
  }) : super(id: id, valor: vaccine);
}

class OpStateEntity extends OpDropdown {
  OpStateEntity({
    required String id,
    required String state,
  }) : super(id: id, valor: state);
}

class OpSymptomsAntigenEntity extends OpDropdown {
  OpSymptomsAntigenEntity({
    required String id,
    required String symptoms,
  }) : super(id: id, valor: symptoms);
}

class MessageEntity {
  MessageEntity({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;
}
