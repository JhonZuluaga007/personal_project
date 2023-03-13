import 'dart:convert';

import 'package:Tellme/features/antigen/domain/entities/antigen_entity.dart';

import '../../../test_history/data/models/test_history_models.dart';

class AntigenModel {
  AntigenModel({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final Data? data;
  final String? message;
  final int? statusCode;

  factory AntigenModel.fromJson(String str) =>
      AntigenModel.fromMap(json.decode(str));

  factory AntigenModel.fromMap(Map<String, dynamic> json) => AntigenModel(
        data: Data.fromMap(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
      );
}

class Data extends DataEntity {
  Data({
    required Lasttest? lasttest,
    required int? testTime,
  }) : super(lasttest: lasttest, testTime: testTime);

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        lasttest: Lasttest.fromMap(json["lasttest"]),
        testTime: json["test_time"],
      );
}

class Lasttest extends LasttestEntity {
  Lasttest({
    required IdHistory id,
    required CreatedHistory created,
    required IdHistory idTest,
    required String ip,
    required QuestionTypeOne question1,
    required QuestionTypeTwo question10,
    required QuestionTypeTwo question11,
    required QuestionTypeTwo question12,
    required QuestionTypeOne question13,
    required QuestionTypeOne question14,
    required QuestionTypeOne question15,
    required QuestionTypeTwo question2,
    required QuestionTypeOne question3,
    required QuestionTypeOne question4,
    required QuestionTypeOne question5,
    required QuestionTypeOne question6,
    required QuestionTypeOne question7,
    required QuestionTypeOne question8,
    required QuestionTypeOne question9,
    required CreatedHistory updated,
  }) : super(
            id: id,
            created: created,
            idTest: idTest,
            ip: ip,
            question1: question1,
            question10: question10,
            question11: question11,
            question12: question12,
            question13: question13,
            question14: question14,
            question15: question15,
            question2: question2,
            question3: question3,
            question4: question4,
            question5: question5,
            question6: question6,
            question7: question7,
            question8: question8,
            question9: question9,
            updated: updated);
  factory Lasttest.fromJson(String str) => Lasttest.fromMap(json.decode(str));

  factory Lasttest.fromMap(Map<String, dynamic> json) => Lasttest(
        id: IdHistory.fromMap(json["_id"]),
        created: CreatedHistory.fromMap(json["created"]),
        idTest: IdHistory.fromMap(json["idTest"]),
        ip: json["ip"],
        question1: QuestionTypeOne.fromMap(json["question1"]),
        question10: QuestionTypeTwo.fromMap(json["question10"]),
        question11: QuestionTypeTwo.fromMap(json["question11"]),
        question12: QuestionTypeTwo.fromMap(json["question12"]),
        question13: QuestionTypeOne.fromMap(json["question13"]),
        question14: QuestionTypeOne.fromMap(json["question14"]),
        question15: QuestionTypeOne.fromMap(json["question15"]),
        question2: QuestionTypeTwo.fromMap(json["question2"]),
        question3: QuestionTypeOne.fromMap(json["question3"]),
        question4: QuestionTypeOne.fromMap(json["question4"]),
        question5: QuestionTypeOne.fromMap(json["question5"]),
        question6: QuestionTypeOne.fromMap(json["question6"]),
        question7: QuestionTypeOne.fromMap(json["question7"]),
        question8: QuestionTypeOne.fromMap(json["question8"]),
        question9: QuestionTypeOne.fromMap(json["question9"]),
        updated: CreatedHistory.fromMap(json["updated"]),
      );
}

class QuestionTypeOne extends QuestionTypeOneEntity {
  QuestionTypeOne({
    required String? name,
    required String? value,
  }) : super(name: name, value: value);

  factory QuestionTypeOne.fromJson(String str) =>
      QuestionTypeOne.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionTypeOne.fromMap(Map<String, dynamic> json) => QuestionTypeOne(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
      };
}

class QuestionTypeTwo extends QuestionTypeTwoEntity {
  QuestionTypeTwo({
    required String? name,
    required List<String>? value,
  }) : super(name: name, value: value);

  factory QuestionTypeTwo.fromJson(String str) =>
      QuestionTypeTwo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionTypeTwo.fromMap(Map<String, dynamic> json) => QuestionTypeTwo(
        name: json["name"],
        value: List<String>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": List<dynamic>.from(value!.map((x) => x)),
      };
}
