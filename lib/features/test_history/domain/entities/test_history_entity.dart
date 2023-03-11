class TestEntity {
  TestEntity({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataHistoryEntity? data;
  final MessageEntity message;
  final int statusCode;
}

class DataHistoryEntity {
  final List<TestHistoryEntity>? tests;

  DataHistoryEntity({this.tests});
}

class TestHistoryEntity {
  TestHistoryEntity({
    required this.ic,
    required this.n,
    required this.orf1Ab,
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.laboratory,
    required this.manufacturer,
    required this.preparedBy,
    required this.project,
    required this.result,
    required this.sampleDate,
    required this.status,
    required this.statusHistory,
    required this.swabType,
    required this.symptoms,
    required this.type,
    required this.updated,
    required this.user,
    required this.validity,
    required this.vialName,
    required this.form,
    required this.photo,
    required this.stepHistory,
    required this.vaccines,
  });

  final int? ic;
  final int? n;
  final int? orf1Ab;
  final IdEntity? id;
  final List<IdEntity>? associatedTests;
  final IdEntity? batch;
  final String? code;
  final CreatedEntity? created;
  final List<dynamic>? laboratory;
  final List<dynamic>? manufacturer;
  final IdEntity? preparedBy;
  final IdEntity? project;
  final List<ResultEntity>? result;
  final CreatedEntity? sampleDate;
  final List<StatusEntity>? status;
  final List<StatusEntity>? statusHistory;
  final List<dynamic>? swabType;
  final List<dynamic>? symptoms;
  final List<TypeEntity>? type;
  final CreatedEntity? updated;
  final IdEntity? user;
  final List<ValidityEntity>? validity;
  final String? vialName;
  final IdEntity? form;
  final List<String>? photo;
  final List<dynamic>? stepHistory;
  final List<dynamic>? vaccines;
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

  final IdEntity id;
  final String result;
}

class StatusEntity {
  StatusEntity({
    required this.id,
    required this.status,
  });

  final IdEntity id;
  final String status;
}

class TypeEntity {
  TypeEntity({
    required this.id,
    required this.hasBandType,
    required this.hasGeneCycle,
    required this.testLetter,
    required this.type,
  });

  final IdEntity id;
  final bool hasBandType;
  final bool hasGeneCycle;
  final String testLetter;
  final String type;
}

class ValidityEntity {
  ValidityEntity({
    required this.id,
    required this.validity,
  });

  final IdEntity id;
  final String validity;
}

class MessageEntity {
  MessageEntity({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;
}
