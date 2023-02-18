class HelperToolsEntity {
  HelperToolsEntity({
    required this.data,
  });

  final DataEntity data;
}

class DataEntity {
  DataEntity({
    required this.opEthnicity,
    required this.opGender,
    required this.opLaboratory,
    required this.opManufacturer,
    required this.opRace,
    required this.opRoles,
    required this.opSex,
    required this.opSwabType,
    required this.opTestType,
  });

  final List<OpEthnicityEntity> opEthnicity;
  final List<OpGenderEntity> opGender;
  final List<OpLaboratoryEntity> opLaboratory;
  final List<OpManufacturerEntity> opManufacturer;
  final List<OpRaceEntity> opRace;
  final List<OpRoleEntity> opRoles;
  final List<OpSexEntity> opSex;
  final List<OpSwabTypeEntity> opSwabType;
  final List<OpTestTypeEntity> opTestType;
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

class OpLaboratoryEntity extends OpDropdown {
  OpLaboratoryEntity({
    required String id,
    required String name,
  }) : super(id: id, valor: name);
}

class OpManufacturerEntity extends OpDropdown {
  OpManufacturerEntity({
    required String id,
    required String name,
    required this.testTime,
  }) : super(id: id, valor: name);

  final int testTime;
}

class OpRaceEntity extends OpDropdown {
  OpRaceEntity({
    required String id,
    required String race,
  }) : super(id: id, valor: race);
}

class OpRoleEntity extends OpDropdown {
  OpRoleEntity({
    required String id,
    required String role,
  }) : super(id: id, valor: role);
}

class OpSexEntity extends OpDropdown {
  OpSexEntity({
    required String id,
    required String sex,
  }) : super(id: id, valor: sex);
}

class OpSwabTypeEntity extends OpDropdown {
  OpSwabTypeEntity({
    required String id,
    required String type,
  }) : super(id: id, valor: type);
}

class OpStateEntity extends OpDropdown {
  OpStateEntity({
    required String id,
    required String state,
  }) : super(id: id, valor: state);
}

class OpPregnantEntity extends OpDropdown {
  OpPregnantEntity({
    required String id,
    required String pregnant,
  }) : super(id: id, valor: pregnant);
}

class OpTestTypeEntity {
  OpTestTypeEntity({
    required this.id,
    required this.hasBandType,
    required this.hasGeneCycle,
    required this.testLetter,
    required this.type,
  });
  final String id;
  final bool hasBandType;
  final bool hasGeneCycle;
  final String testLetter;
  final String type;
}
