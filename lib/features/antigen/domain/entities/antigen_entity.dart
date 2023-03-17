import 'package:Tellme/features/test_history/domain/entities/test_history_entity.dart';

class AntigenResponseEntity {
  AntigenResponseEntity({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataAntigenEntity data;
  final MessageTestEntity message;
  final int statusCode;
}

class DataAntigenEntity {
  DataAntigenEntity({
    this.lastTest,
    required this.test,
  });

  final LastTestAntigenEntity? lastTest;
  final TestAntigenEntity test;
}

class LastTestAntigenEntity {
  LastTestAntigenEntity({
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.form,
    required this.laboratory,
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
  final List<FormAntigenEntity> form;
  final List<dynamic> laboratory;
  final List<dynamic> manufacturer;
  final List<String> photo;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final List<ResultTestEntity> result;
  final CreatedTestEntity sampleDate;
  final List<StatusTestEntity> status;
  final List<StatusHistoryEntity> statusHistory;
  final List<dynamic> stepHistory;
  final List<dynamic> swabType;
  final List<dynamic> symptoms;
  final List<TypeTestEntity> type;
  final CreatedTestEntity updated;
  final List<dynamic> vaccines;
  final List<ValidityTestEntity> validity;
}

class FormAntigenEntity {
  FormAntigenEntity({
    required this.id,
    required this.ip,
    required this.question1,
    required this.question10,
    required this.question11,
    required this.question12,
    required this.question13,
    required this.question14,
    required this.question15,
    required this.question2,
    required this.question3,
    required this.question4,
    required this.question5,
    required this.question6,
    required this.question7,
    required this.question8,
    required this.question9,
    required this.test,
  });

  final IdTestEntity id;
  final String ip;
  final QuestionType1StringEntity question1;
  final QuestionType10ListEntity question10;
  final QuestionType10ListEntity question11;
  final QuestionType10ListEntity question12;
  final QuestionType1StringEntity question13;
  final QuestionType1StringEntity question14;
  final QuestionType1StringEntity question15;
  final QuestionType10ListEntity question2;
  final QuestionType1StringEntity question3;
  final QuestionType1StringEntity question4;
  final QuestionType1StringEntity question5;
  final QuestionType1StringEntity question6;
  final QuestionType1StringEntity question7;
  final QuestionType1StringEntity question8;
  final QuestionType1StringEntity question9;
  final IdTestEntity test;
}

class QuestionType1StringEntity {
  QuestionType1StringEntity({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class QuestionType10ListEntity {
  QuestionType10ListEntity({
    required this.name,
    required this.value,
  });

  final String name;
  final List<String> value;

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class TestAntigenEntity {
  TestAntigenEntity({
    required this.id,
    required this.associatedTests,
    required this.batch,
    required this.code,
    required this.created,
    required this.form,
    required this.laboratory,
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
  final Object form;
  final List<dynamic> laboratory;
  final List<ManufacturerAntigenEntity> manufacturer;
  final List<dynamic> photo;
  final IdTestEntity preparedBy;
  final IdTestEntity project;
  final Object result;
  final String sampleDate;
  final List<StatusTestEntity> status;
  final List<StatusHistoryEntity> statusHistory;
  final List<dynamic> stepHistory;
  final List<dynamic> swabType;
  final List<dynamic> symptoms;
  final List<TypeTestEntity> type;
  final CreatedTestEntity updated;
  final List<dynamic> vaccines;
  final List<dynamic> validity;
}

class ManufacturerAntigenEntity {
  ManufacturerAntigenEntity({
    required this.id,
    required this.name,
    required this.project,
    required this.testTime,
  });

  final IdTestEntity id;
  final String name;
  final IdTestEntity project;
  final int testTime;
}
