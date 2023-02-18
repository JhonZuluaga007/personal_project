import 'dart:convert';

import 'package:personal_project/features/antigen/domain/entities/antigen_entity.dart';
import 'package:personal_project/features/test_history/domain/entities/test_history_entity.dart';

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
    required Id id,
    required Created created,
    required Id idTest,
    required String ip,
    required Question1Class question1,
    required Question10Class question10,
    required Question10Class question11,
    required Question10Class question12,
    required Question1Class question13,
    required Question1Class question14,
    required Question1Class question15,
    required Question10Class question2,
    required Question1Class question3,
    required Question1Class question4,
    required Question1Class question5,
    required Question1Class question6,
    required Question1Class question7,
    required Question1Class question8,
    required Question1Class question9,
    required Created updated,
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
        id: Id.fromMap(json["_id"]),
        created: Created.fromMap(json["created"]),
        idTest: Id.fromMap(json["idTest"]),
        ip: json["ip"],
        question1: Question1Class.fromMap(json["question1"]),
        question10: Question10Class.fromMap(json["question10"]),
        question11: Question10Class.fromMap(json["question11"]),
        question12: Question10Class.fromMap(json["question12"]),
        question13: Question1Class.fromMap(json["question13"]),
        question14: Question1Class.fromMap(json["question14"]),
        question15: Question1Class.fromMap(json["question15"]),
        question2: Question10Class.fromMap(json["question2"]),
        question3: Question1Class.fromMap(json["question3"]),
        question4: Question1Class.fromMap(json["question4"]),
        question5: Question1Class.fromMap(json["question5"]),
        question6: Question1Class.fromMap(json["question6"]),
        question7: Question1Class.fromMap(json["question7"]),
        question8: Question1Class.fromMap(json["question8"]),
        question9: Question1Class.fromMap(json["question9"]),
        updated: Created.fromMap(json["updated"]),
      );
}

class Created extends CreatedEntity {
  Created({
    required DateTime? date,
  }) : super(date: date!);
  factory Created.fromJson(String str) => Created.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Created.fromMap(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Id extends IdEntity {
  Id({
    required String? oid,
  }) : super(oid: oid);

  factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024oid": oid,
      };
}

class Question1Class extends Question1ClassEntity {
  Question1Class({
    required String? name,
    required String? value,
  }) : super(name: name, value: value);

  factory Question1Class.fromJson(String str) =>
      Question1Class.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question1Class.fromMap(Map<String, dynamic> json) => Question1Class(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
      };
}

class Question10Class extends Question10ClassEntity {
  Question10Class({
    required String? name,
    required List<String>? value,
  }) : super(name: name, value: value);

  factory Question10Class.fromJson(String str) =>
      Question10Class.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question10Class.fromMap(Map<String, dynamic> json) => Question10Class(
        name: json["name"],
        value: List<String>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": List<dynamic>.from(value!.map((x) => x)),
      };
}
