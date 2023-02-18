import 'dart:convert';

import '../../domain/entities/helper_tools_entity.dart';

HelperToolsModel helperToolsModelFromJson(String str) =>
    HelperToolsModel.fromJson(json.decode(str));

class HelperToolsModel extends HelperToolsEntity {
  HelperToolsModel({required Data data}) : super(data: data);

  factory HelperToolsModel.fromJson(Map<String, dynamic> json) =>
      HelperToolsModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data extends DataEntity {
  Data({
    required List<OpEthnicity> opEthnicity,
    required List<OpGender> opGender,
    required List<OpLaboratory> opLaboratory,
    required List<OpManufacturer> opManufacturer,
    required List<OpRace> opRace,
    required List<OpRole> opRoles,
    required List<OpSex> opSex,
    required List<OpSwabType> opSwabType,
    required List<OpTestType> opTestType,
  }) : super(
          opEthnicity: opEthnicity,
          opGender: opGender,
          opLaboratory: opLaboratory,
          opManufacturer: opManufacturer,
          opRace: opRace,
          opRoles: opRoles,
          opSex: opSex,
          opSwabType: opSwabType,
          opTestType: opTestType,
        );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        opEthnicity: List<OpEthnicity>.from(
            json["op_ethnicity"].map((x) => OpEthnicity.fromJson(x))),
        opGender: List<OpGender>.from(
            json["op_gender"].map((x) => OpGender.fromJson(x))),
        opLaboratory: List<OpLaboratory>.from(
            json["op_laboratory"].map((x) => OpLaboratory.fromJson(x))),
        opManufacturer: List<OpManufacturer>.from(
            json["op_manufacturer"].map((x) => OpManufacturer.fromJson(x))),
        opRace:
            List<OpRace>.from(json["op_race"].map((x) => OpRace.fromJson(x))),
        opRoles:
            List<OpRole>.from(json["op_roles"].map((x) => OpRole.fromJson(x))),
        opSex: List<OpSex>.from(json["op_sex"].map((x) => OpSex.fromJson(x))),
        opSwabType: List<OpSwabType>.from(
            json["op_swabType"].map((x) => OpSwabType.fromJson(x))),
        opTestType: List<OpTestType>.from(
            json["op_testType"].map((x) => OpTestType.fromJson(x))),
      );
}

class OpEthnicity extends OpEthnicityEntity {
  OpEthnicity({
    required String id,
    required String ethnicity,
  }) : super(
          id: id,
          ethnicity: ethnicity,
        );

  factory OpEthnicity.fromJson(Map<String, dynamic> json) => OpEthnicity(
        id: json["_id"],
        ethnicity: json["ethnicity"],
      );
}

class OpGender extends OpGenderEntity {
  OpGender({
    required String id,
    required String gender,
  }) : super(
          id: id,
          gender: gender,
        );

  factory OpGender.fromJson(Map<String, dynamic> json) => OpGender(
        id: json["_id"],
        gender: json["gender"],
      );
}

class OpLaboratory extends OpLaboratoryEntity {
  OpLaboratory({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory OpLaboratory.fromJson(Map<String, dynamic> json) => OpLaboratory(
        id: json["_id"],
        name: json["name"],
      );
}

class OpManufacturer extends OpManufacturerEntity {
  OpManufacturer({
    required String id,
    required String name,
    required int testTime,
  }) : super(
          id: id,
          name: name,
          testTime: testTime,
        );

  factory OpManufacturer.fromJson(Map<String, dynamic> json) => OpManufacturer(
        id: json["_id"],
        name: json["name"],
        testTime: json["test_time"],
      );
}

class OpRace extends OpRaceEntity {
  OpRace({
    required String id,
    required String race,
  }) : super(
          id: id,
          race: race,
        );

  factory OpRace.fromJson(Map<String, dynamic> json) => OpRace(
        id: json["_id"],
        race: json["race"],
      );
}

class OpRole extends OpRoleEntity {
  OpRole({
    required String id,
    required String role,
  }) : super(
          id: id,
          role: role,
        );

  factory OpRole.fromJson(Map<String, dynamic> json) => OpRole(
        id: json["_id"],
        role: json["role"],
      );
}

class OpSex extends OpSexEntity {
  OpSex({
    required String id,
    required String sex,
  }) : super(
          id: id,
          sex: sex,
        );

  factory OpSex.fromJson(Map<String, dynamic> json) => OpSex(
        id: json["_id"],
        sex: json["sex"],
      );
}

class OpSwabType extends OpSwabTypeEntity {
  OpSwabType({
    required String id,
    required String type,
  }) : super(
          id: id,
          type: type,
        );

  factory OpSwabType.fromJson(Map<String, dynamic> json) => OpSwabType(
        id: json["_id"],
        type: json["type"],
      );
}

class OpTestType extends OpTestTypeEntity {
  OpTestType({
    required String id,
    required bool hasBandType,
    required bool hasGeneCycle,
    required String testLetter,
    required String type,
  }) : super(
          id: id,
          hasBandType: hasBandType,
          hasGeneCycle: hasGeneCycle,
          testLetter: testLetter,
          type: type,
        );

  factory OpTestType.fromJson(Map<String, dynamic> json) => OpTestType(
        id: json["_id"],
        hasBandType: json["has_band_type"],
        hasGeneCycle: json["has_gene_cycle"],
        testLetter: json["test_letter"],
        type: json["type"],
      );
}
