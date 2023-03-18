import '../../domain/entities/options_tools_entity.dart';

class OptionsToolsModel extends OptionsToolsEntity {
  OptionsToolsModel({
    required Data data,
    required Message message,
    required int statusCode,
  }) : super(
          data: data,
          message: message,
          statusCode: statusCode,
        );

  factory OptionsToolsModel.fromJson(Map<String, dynamic> json) =>
      OptionsToolsModel(
        data: Data.fromJson(json["data"]),
        message: Message.fromJson(json["message"]),
        statusCode: json["statusCode"],
      );
}

class Data extends DataEntity {
  Data({
    required List<Ethnicity> ethnicities,
    required List<Gender> genders,
    required List<Race> races,
    required List<RiskFactor> riskFactors,
    required List<SchoolLevel> schoolLevels,
    required List<Sex> sexes,
    required List<States> states,
    required List<Symptom> symptoms,
    required List<TestResult> testResults,
    required List<TestStatus> testStatus,
    required List<TestType> testTypes,
    required List<TestValidity> testValidities,
    required List<Vaccine> vaccines,
  }) : super(
          ethnicities: ethnicities,
          genders: genders,
          races: races,
          riskFactors: riskFactors,
          schoolLevels: schoolLevels,
          sexes: sexes,
          states: states,
          symptoms: symptoms,
          testResults: testResults,
          testStatus: testStatus,
          testTypes: testTypes,
          testValidities: testValidities,
          vaccines: vaccines,
        );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ethnicities: List<Ethnicity>.from(
            json["ethnicities"].map((x) => Ethnicity.fromJson(x))),
        genders:
            List<Gender>.from(json["genders"].map((x) => Gender.fromJson(x))),
        races: List<Race>.from(json["races"].map((x) => Race.fromJson(x))),
        riskFactors: List<RiskFactor>.from(
            json["risk_factors"].map((x) => RiskFactor.fromJson(x))),
        schoolLevels: List<SchoolLevel>.from(
            json["school_levels"].map((x) => SchoolLevel.fromJson(x))),
        sexes: List<Sex>.from(json["sexes"].map((x) => Sex.fromJson(x))),
        states:
            List<States>.from(json["states"].map((x) => States.fromJson(x))),
        symptoms: List<Symptom>.from(
            json["symptoms"].map((x) => Symptom.fromJson(x))),
        testResults: List<TestResult>.from(
            json["test_results"].map((x) => TestResult.fromJson(x))),
        testStatus: List<TestStatus>.from(
            json["test_status"].map((x) => TestStatus.fromJson(x))),
        testTypes: List<TestType>.from(
            json["test_types"].map((x) => TestType.fromJson(x))),
        testValidities: List<TestValidity>.from(
            json["test_validities"].map((x) => TestValidity.fromJson(x))),
        vaccines: List<Vaccine>.from(
            json["vaccines"].map((x) => Vaccine.fromJson(x))),
      );
}

class Ethnicity extends OpEthnicityEntity {
  Ethnicity({
    required Id id,
    required String ethnicity,
  }) : super(
          id: id.oid,
          ethnicity: ethnicity,
        );

  factory Ethnicity.fromJson(Map<String, dynamic> json) => Ethnicity(
        id: Id.fromJson(json["_id"]),
        ethnicity: json["ethnicity"],
      );
}

class Id extends IdEntity {
  Id({
    required String oid,
  }) : super(
          oid: oid,
        );

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class Gender extends OpGenderEntity {
  Gender({
    required Id id,
    required String gender,
  }) : super(
          id: id.oid,
          gender: gender,
        );

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: Id.fromJson(json["_id"]),
        gender: json["gender"],
      );
}

class Race extends OpRaceEntity {
  Race({
    required Id id,
    required String race,
  }) : super(
          id: id.oid,
          race: race,
        );

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        id: Id.fromJson(json["_id"]),
        race: json["race"],
      );
}

class RiskFactor extends OpRiskFactorEntity {
  RiskFactor({
    required Id id,
    required Id disease,
    required Id project,
    required String riskFactor,
  }) : super(
          id: id.oid,
          disease: disease,
          project: project,
          riskFactor: riskFactor,
        );

  factory RiskFactor.fromJson(Map<String, dynamic> json) => RiskFactor(
        id: Id.fromJson(json["_id"]),
        disease: Id.fromJson(json["disease"]),
        project: Id.fromJson(json["project"]),
        riskFactor: json["risk_factor"],
      );
}

class SchoolLevel extends OpSchoolLevelEntity {
  SchoolLevel({
    required Id id,
    required String level,
    required int order,
    required Id project,
  }) : super(
          id: id.oid,
          level: level,
          order: order,
          project: project,
        );

  factory SchoolLevel.fromJson(Map<String, dynamic> json) => SchoolLevel(
        id: Id.fromJson(json["_id"]),
        level: json["level"],
        order: json["order"],
        project: Id.fromJson(json["project"]),
      );
}

class Sex extends OpSexEntity {
  Sex({
    required Id id,
    required String sex,
  }) : super(
          id: id.oid,
          sex: sex,
        );

  factory Sex.fromJson(Map<String, dynamic> json) => Sex(
        id: Id.fromJson(json["_id"]),
        sex: json["sex"],
      );
}

class States extends OpStatesEntity {
  States({
    required Id id,
    required String states,
  }) : super(
          id: id.oid,
          states: states,
        );

  factory States.fromJson(Map<String, dynamic> json) => States(
        id: Id.fromJson(json["_id"]),
        states: json["state"],
      );
}

class Symptom extends OpSymptomEntity {
  Symptom({
    required Id id,
    required Id project,
    required String symptom,
  }) : super(
          id: id.oid,
          project: project,
          symptom: symptom,
        );

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        id: Id.fromJson(json["_id"]),
        project: Id.fromJson(json["project"]),
        symptom: json["symptom"],
      );
}

class TestResult extends OpTestResultEntity {
  TestResult({
    required Id id,
    required String result,
  }) : super(
          id: id.oid,
          result: result,
        );

  factory TestResult.fromJson(Map<String, dynamic> json) => TestResult(
        id: Id.fromJson(json["_id"]),
        result: json["result"],
      );
}

class TestStatus extends OpTestStatusEntity {
  TestStatus({
    required Id id,
    required String status,
  }) : super(
          id: id.oid,
          status: status,
        );

  factory TestStatus.fromJson(Map<String, dynamic> json) => TestStatus(
        id: Id.fromJson(json["_id"]),
        status: json["status"],
      );
}

class TestType extends OpTestTypeEntity {
  TestType({
    required Id id,
    required bool hasBandType,
    required bool hasGeneCycle,
    required String testLetter,
    required String type,
  }) : super(
          id: id.oid,
          hasBandType: hasBandType,
          hasGeneCycle: hasGeneCycle,
          testLetter: testLetter,
          type: type,
        );

  factory TestType.fromJson(Map<String, dynamic> json) => TestType(
        id: Id.fromJson(json["_id"]),
        hasBandType: json["has_band_type"],
        hasGeneCycle: json["has_gene_cycle"],
        testLetter: json["test_letter"],
        type: json["type"],
      );
}

class TestValidity extends OpTestValidityEntity {
  TestValidity({
    required Id id,
    required String validity,
  }) : super(
          id: id.oid,
          validity: validity,
        );

  factory TestValidity.fromJson(Map<String, dynamic> json) => TestValidity(
        id: Id.fromJson(json["_id"]),
        validity: json["validity"],
      );
}

class Vaccine extends OpVaccineEntity {
  Vaccine({
    required Id id,
    required Id project,
    required String vaccine,
  }) : super(
          id: id.oid,
          project: project,
          vaccine: vaccine,
        );

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: Id.fromJson(json["_id"]),
        project: Id.fromJson(json["project"]),
        vaccine: json["vaccine"],
      );
}

class Message extends MessageEntity {
  Message({
    required String text,
    required String type,
  }) : super(
          text: text,
          type: type,
        );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}
