part of 'helper_tools_bloc.dart';

@immutable
class HelperToolsState {
  final List<OpEthnicityEntity> opEthnicity;
  final List<OpGenderEntity> opGender;
  final List<OpLaboratoryEntity> opLaboratory;
  final List<OpManufacturerEntity> opManufacturer;
  final List<OpRaceEntity> opRace;
  final List<OpRoleEntity> opRoles;
  final List<OpSexEntity> opSex;
  final List<OpSwabTypeEntity> opSwabType;
  final List<OpTestTypeEntity> opTestType;

  const HelperToolsState({
    this.opEthnicity = const [],
    this.opGender = const [],
    this.opLaboratory = const [],
    this.opManufacturer = const [],
    this.opRace = const [],
    this.opRoles = const [],
    this.opSex = const [],
    this.opSwabType = const [],
    this.opTestType = const [],
  });

  HelperToolsState copyWith({
    List<OpEthnicityEntity>? opEthnicity,
    List<OpGenderEntity>? opGender,
    List<OpLaboratoryEntity>? opLaboratory,
    List<OpManufacturerEntity>? opManufacturer,
    List<OpRaceEntity>? opRace,
    List<OpRoleEntity>? opRoles,
    List<OpSexEntity>? opSex,
    List<OpSwabTypeEntity>? opSwabType,
    List<OpTestTypeEntity>? opTestType,
  }) {
    return HelperToolsState(
      opEthnicity: opEthnicity ?? this.opEthnicity,
      opGender: opGender ?? this.opGender,
      opLaboratory: opLaboratory ?? this.opLaboratory,
      opManufacturer: opManufacturer ?? this.opManufacturer,
      opRace: opRace ?? this.opRace,
      opRoles: opRoles ?? this.opRoles,
      opSex: opSex ?? this.opSex,
      opSwabType: opSwabType ?? this.opSwabType,
      opTestType: opTestType ?? this.opTestType,
    );
  }
}
