import '../../../antigen/domain/entities/antigen_entity.dart';

class TestHistoryResponseEntity {
  TestHistoryResponseEntity({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataHistoryEntity data;
  final MessageTestEntity message;
  final int statusCode;
}

class DataHistoryEntity {
  DataHistoryEntity({
    required this.tests,
  });

  final List<TestHistoryEntity> tests;
}

class TestHistoryEntity {
  TestHistoryEntity({
    // required this.ic,
    // required this.n,
    // required this.orf1Ab,
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
    required this.vaccines,
    required this.validity,
    required this.vialName,
    required this.form,
    required this.photo,
    required this.stepHistory,
  });

  // final double ic;
  // final double n;
  // final double orf1Ab;
  final IdTestEntity id;
  final List<AssociatedTestEntity> associatedTests;
  final IdTestEntity batch;
  final String code;
  final CreatedTestEntity created;
  final List<LaboratoryTestEntity> laboratory;
  final List<ManufacturerAntigenEntity> manufacturer;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final List<ResultTestEntity> result;
  final CreatedTestEntity sampleDate;
  final List<StatusTestEntity> status;
  final List<StatusHistoryEntity> statusHistory;
  final List<SwabTypeHistoryEntity> swabType;
  final List<dynamic> symptoms;
  final List<TypeTestEntity> type;
  final CreatedTestEntity updated;
  final List<dynamic> vaccines;
  final List<ValidityTestEntity> validity;
  final String vialName;
  final IdTestEntity form;
  final String photo;
  final List<dynamic> stepHistory;
}

class AssociatedTestEntity {
  AssociatedTestEntity({
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.form,
    required this.manufacturer,
    required this.photo,
    required this.preparedBy,
    required this.project,
    required this.result,
    required this.sampleDate,
    required this.status,
    required this.statusHistory,
    required this.stepHistory,
    required this.swabType,
    required this.symptoms,
    required this.type,
    required this.updated,
    required this.vaccines,
    required this.validity,
  });

  final IdTestEntity id;
  final List<dynamic> associatedTests;
  final IdTestEntity batch;
  final String code;
  final CreatedTestEntity created;
  final IdTestEntity form;
  final IdTestEntity manufacturer;
  final String photo;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final IdTestEntity result;
  final CreatedTestEntity sampleDate;
  final IdTestEntity status;
  final List<StatusHistoryEntity> statusHistory;
  final List<dynamic> stepHistory;
  final IdTestEntity swabType;
  final List<IdTestEntity> symptoms;
  final IdTestEntity type;
  final CreatedTestEntity updated;
  final List<dynamic> vaccines;
  final IdTestEntity validity;
}

class IdTestEntity {
  IdTestEntity({
    required this.oid,
  });

  final String oid;
}

class CreatedTestEntity {
  CreatedTestEntity({
    required this.date,
  });

  final DateTime date;
}

class StatusHistoryEntity {
  StatusHistoryEntity({
    required this.date,
    required this.status,
  });

  final CreatedTestEntity date;
  final IdTestEntity status;
}

class SwabTypeHistoryEntity {
  SwabTypeHistoryEntity({
    required this.id,
    required this.type,
  });

  final IdTestEntity id;
  final String type;
}

class LaboratoryTestEntity {
  LaboratoryTestEntity({
    required this.id,
    required this.name,
    required this.project,
  });

  final IdTestEntity id;
  final String name;
  final IdTestEntity project;
}

class ResultTestEntity {
  ResultTestEntity({
    required this.id,
    required this.result,
  });

  final IdTestEntity id;
  final String result;
}

class StatusTestEntity {
  StatusTestEntity({
    required this.id,
    required this.status,
  });

  final IdTestEntity id;
  final String status;
}

class TypeTestEntity {
  TypeTestEntity({
    required this.id,
    required this.hasBandType,
    required this.hasGeneCycle,
    required this.testLetter,
    required this.type,
  });

  final IdTestEntity id;
  final bool hasBandType;
  final bool hasGeneCycle;
  final String testLetter;
  final String type;
}

class ValidityTestEntity {
  ValidityTestEntity({
    required this.id,
    required this.validity,
  });

  final IdTestEntity id;
  final String validity;
}

class MessageTestEntity {
  MessageTestEntity({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;
}
