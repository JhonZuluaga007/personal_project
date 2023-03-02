import 'dart:convert';

import '../../../test_history/domain/entities/test_history_entity.dart';

class DataEntity {
  DataEntity({
    required this.lasttest,
    required this.testTime,
  });

  final LasttestEntity? lasttest;
  final int? testTime;
}

class LasttestEntity {
  LasttestEntity({
    required this.id,
    required this.created,
    required this.idTest,
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
    required this.updated,
  });

  final IdEntity? id;
  final CreatedEntity? created;
  final IdEntity? idTest;
  final String? ip;
  final QuestionTypeOneEntity? question1;
  final QuestionTypeTwoEntity? question2;
  final QuestionTypeOneEntity? question3;
  final QuestionTypeOneEntity? question4;
  final QuestionTypeOneEntity? question5;
  final QuestionTypeOneEntity? question6;
  final QuestionTypeOneEntity? question7;
  final QuestionTypeOneEntity? question8;
  final QuestionTypeOneEntity? question9;
  final QuestionTypeTwoEntity? question10;
  final QuestionTypeTwoEntity? question11;
  final QuestionTypeTwoEntity? question12;
  final QuestionTypeOneEntity? question13;
  final QuestionTypeOneEntity? question14;
  final QuestionTypeOneEntity? question15;
  final CreatedEntity? updated;
}

class QuestionTypeOneEntity {
  QuestionTypeOneEntity({
    required this.name,
    required this.value,
  });

  final String? name;
  final String? value;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
      };
}

class QuestionTypeTwoEntity {
  QuestionTypeTwoEntity({
    required this.name,
    required this.value,
  });

  final String? name;
  final List<String>? value;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": List<dynamic>.from(value!.map((x) => x)),
      };
}
