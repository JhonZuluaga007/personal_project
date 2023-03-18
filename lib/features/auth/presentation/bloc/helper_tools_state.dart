part of 'helper_tools_bloc.dart';

@immutable
class HelperToolsState {
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
  final List<OpStatesEntity> state;
  final List<String> answer;

  const HelperToolsState({
    this.ethnicities = const [],
    this.genders = const [],
    this.races = const [],
    this.riskFactors = const [],
    this.schoolLevels = const [],
    this.sexes = const [],
    this.symptoms = const [],
    this.testResults = const [],
    this.testStatus = const [],
    this.testTypes = const [],
    this.testValidities = const [],
    this.vaccines = const [],
    this.state = const [],
    this.answer = const [],
  });

  HelperToolsState copyWith({
    List<OpEthnicityEntity>? ethnicities,
    List<OpGenderEntity>? genders,
    List<OpRaceEntity>? races,
    List<OpRiskFactorEntity>? riskFactors,
    List<OpSchoolLevelEntity>? schoolLevels,
    List<OpSexEntity>? sexes,
    List<OpSymptomEntity>? symptoms,
    List<OpTestResultEntity>? testResults,
    List<OpTestStatusEntity>? testStatus,
    List<OpTestTypeEntity>? testTypes,
    List<OpTestValidityEntity>? testValidities,
    List<OpVaccineEntity>? vaccines,
    List<OpStatesEntity>? state,
    List<String>? answer,
  }) {
    return HelperToolsState(
      ethnicities: ethnicities ?? this.ethnicities,
      genders: genders ?? this.genders,
      races: races ?? this.races,
      riskFactors: riskFactors ?? this.riskFactors,
      schoolLevels: schoolLevels ?? this.schoolLevels,
      sexes: sexes ?? this.sexes,
      symptoms: symptoms ?? this.symptoms,
      testResults: testResults ?? this.testResults,
      testStatus: testStatus ?? this.testStatus,
      testTypes: testTypes ?? this.testTypes,
      testValidities: testValidities ?? this.testValidities,
      vaccines: vaccines ?? this.vaccines,
      state: state ?? this.state,
      answer: answer ?? this.answer,
    );
  }
}
