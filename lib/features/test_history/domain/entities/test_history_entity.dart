class TestHistoryEntity {
  TestHistoryEntity({
    required this.id,
    required this.batch,
    required this.code,
    required this.created,
    required this.form,
    required this.manufacturer,
    required this.photo,
    required this.result,
    required this.sampleDate,
    required this.status,
    required this.statusHistory,
    required this.stepHistory,
    required this.swabType,
    required this.type,
    required this.updated,
    required this.user,
    required this.validity,
  });

  final IdEntity? id;
  final IdEntity? batch;
  final String? code;
  final CreatedEntity? created;
  final IdEntity? form;
  final IdEntity? manufacturer;
  final List<String?>? photo;
  final List<ResultEntity?>? result;
  final CreatedEntity? sampleDate;
  final StatusEntity? status;
  final List<StatusHistoryEntity?>? statusHistory;
  final String? stepHistory;
  final IdEntity? swabType;
  final TypeEntity? type;
  final CreatedEntity? updated;
  final IdEntity? user;
  final List<ValidityEntity?>? validity;
}

class IdEntity {
  IdEntity({
    required this.oid,
  });

  final String? oid;
}

class CreatedEntity {
  CreatedEntity({
    required this.date,
  });

  final DateTime date;
}

class ResultEntity {
  ResultEntity({
    required this.id,
    required this.result,
  });

  final IdEntity? id;
  final String? result;
}

class StatusEntity {
  StatusEntity({
    required this.id,
    required this.status,
  });

  final IdEntity? id;
  final String? status;
}

class StatusHistoryEntity {
  StatusHistoryEntity({
    required this.date,
    required this.status,
  });

  final CreatedEntity? date;
  final IdEntity? status;
}

class TypeEntity {
  TypeEntity({
    required this.id,
    required this.hasBandType,
    required this.hasGeneCycle,
    required this.testLetter,
    required this.type,
  });

  final IdEntity? id;
  final bool? hasBandType;
  final bool? hasGeneCycle;
  final String? testLetter;
  final String? type;
}

class ValidityEntity {
  ValidityEntity({
    required this.id,
    required this.validity,
  });

  final IdEntity? id;
  final String? validity;
}
