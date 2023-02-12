import 'dart:convert';

import '../../domain/entities/medical_history_entity.dart';

MedicalHistoryModel medicalHistoryModelFromJson(String str) =>
    MedicalHistoryModel.fromJson(json.decode(str));

class MedicalHistoryModel extends MedicalHistoryEntity {
  MedicalHistoryModel({
    required String id,
    required Ated created,
    required Question1 question1,
    required Question2 question2,
    required bool status,
    required Ated updated,
    required UserId userId,
  }) : super(
            id: id,
            created: created,
            question1: question1,
            question2: question2,
            status: status,
            updated: updated,
            userId: userId);

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      MedicalHistoryModel(
        id: json["_id"],
        created: Ated.fromJson(json["created"]),
        question1: Question1.fromJson(json["question1"]),
        question2: Question2.fromJson(json["question2"]),
        status: json["status"],
        updated: Ated.fromJson(json["updated"]),
        userId: UserId.fromJson(json["user_id"]),
      );
}

class Ated extends AtedEntity {
  Ated({
    required DateTime date,
  }) : super(date: date);

  factory Ated.fromJson(Map<String, dynamic> json) => Ated(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Question1 extends Question1Entity {
  Question1({
    required String name,
    required String value,
  }) : super(name: name, value: value);

  factory Question1.fromJson(Map<String, dynamic> json) => Question1(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Question2 extends Question2Entity {
  Question2({
    required String name,
    required List<String> value,
  }) : super(name: name, value: value);

  factory Question2.fromJson(Map<String, dynamic> json) => Question2(
        name: json["name"],
        value: List<String>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": List<dynamic>.from(value.map((x) => x)),
      };
}

class UserId extends UserIdEntity {
  UserId({
    required String oid,
  }) : super(oid: oid);

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
