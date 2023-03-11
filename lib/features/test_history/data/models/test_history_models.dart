import 'package:Tellme/features/test_history/domain/entities/test_history_entity.dart';
import 'dart:convert';

class TestHistoryModel extends TestEntity {
  TestHistoryModel({
    required Data? data,
    required Message message,
    required int statusCode,
  }) : super(data: data, message: message, statusCode: statusCode);

  factory TestHistoryModel.fromJson(Map<String, dynamic> json) =>
      TestHistoryModel(
        data: Data.fromJson(json["data"]),
        message: Message.fromJson(json["message"]),
        statusCode: json["statusCode"],
      );
}

class Data extends DataHistoryEntity {
  Data({
    required List<TestHistory> tests,
  }) : super(tests: tests);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tests: List<TestHistory>.from(
            json["tests"].map((x) => TestHistory.fromJson(x)) ?? ""),
      );
}

class TestHistory extends TestHistoryEntity {
  TestHistory({
    required int? ic,
    required int? n,
    required int? orf1Ab,
    required Id? id,
    required List<Id>? associatedTests,
    required Id? batch,
    required String? code,
    required Created? created,
    required List<dynamic>? laboratory,
    required List<dynamic>? manufacturer,
    required Id? preparedBy,
    required Id? project,
    required List<Result>? result,
    required Created? sampleDate,
    required List<Status>? status,
    required List<Status>? statusHistory,
    required List<dynamic>? swabType,
    required List<dynamic>? symptoms,
    required List<Type>? type,
    required Created? updated,
    required Id? user,
    required List<Validity>? validity,
    required String? vialName,
    required Id? form,
    required List<String>? photo,
    required List<dynamic>? stepHistory,
    required List<dynamic>? vaccines,
  }) : super(
            ic: ic,
            n: n,
            orf1Ab: orf1Ab,
            id: id,
            associatedTests: associatedTests,
            batch: batch,
            code: code,
            created: created,
            laboratory: laboratory,
            manufacturer: manufacturer,
            preparedBy: preparedBy,
            project: project,
            result: result,
            sampleDate: sampleDate,
            status: status,
            statusHistory: statusHistory,
            swabType: swabType,
            symptoms: symptoms,
            type: type,
            updated: updated,
            user: user,
            validity: validity,
            vialName: vialName,
            form: form,
            photo: photo,
            stepHistory: stepHistory,
            vaccines: vaccines);

  factory TestHistory.fromJson(Map<String, dynamic> json) => TestHistory(
        ic: json["IC"] ?? json[""],
        n: json["N"] ?? json[""],
        orf1Ab: json["ORF1ab"] ?? json[""],
        id: Id.fromJson(json["_id"]),
        associatedTests:
            List<Id>.from(json["associated_tests"].map((x) => Id.fromJson(x))),
        batch: Id.fromJson(json["batch"]),
        code: json["code"],
        created: Created.fromJson(json["created"]),
        laboratory: List<dynamic>.from(json["laboratory"].map((x) => x)),
        manufacturer: List<dynamic>.from(json["manufacturer"].map((x) => x)),
        preparedBy: Id.fromJson(json["prepared_by"]),
        project: Id.fromJson(json["project"]),
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        sampleDate: Created.fromJson(json["sample_date"]),
        status: List<Status>.from(json["status"].map((x) => Status.fromJson(x))),
        statusHistory: List<Status>.from(
            json["status_history"].map((x) => Status.fromJson(x))),
        swabType: List<dynamic>.from(json["swab_type"].map((x) => x)),
        symptoms: List<dynamic>.from(json["symptoms"].map((x) => x)),
        type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
        updated: Created.fromJson(json["updated"]),
        user: Id.fromJson(json["user"]),
        validity: List<Validity>.from(
            json["validity"].map((x) => Validity.fromJson(x)) ?? json[""]),
        vialName: json["vial_name"],
        form: json["form"] != null ? Id.fromJson(json["form"]) : Id(oid: ''),
        photo: List<String>.from(json["photo"].map((x) => x)),
        stepHistory: List<dynamic>.from(json["step_history"].map((x) => x)),
        vaccines: List<dynamic>.from(json["vaccines"].map((x) => x)),
      );
}

class Id extends IdEntity {
  Id({
    required String? oid,
  }) : super(oid: oid);

  String toJson() => json.encode(toMap());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toMap() => {
        "\u0024oid": oid,
      };
}

class Created extends CreatedEntity {
  Created({
    required DateTime date,
  }) : super(date: date);

  String toJson() => json.encode(toMap());

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Result extends ResultEntity {
  Result({
    required Id id,
    required String result,
  }) : super(id: id, result: result);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: Id.fromJson(json["_id"]),
        result: json["result"],
      );
}

class Status extends StatusEntity {
  Status({
    required Id id,
    required String status,
  }) : super(id: id, status: status);

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: Id.fromJson(json["_id"]),
        status: json["status"],
      );
}

class Type extends TypeEntity {
  Type({
    required Id id,
    required bool hasBandType,
    required bool hasGeneCycle,
    required String testLetter,
    required String type,
  }) : super(
            id: id,
            hasBandType: hasBandType,
            hasGeneCycle: hasGeneCycle,
            testLetter: testLetter,
            type: type);

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: Id.fromJson(json["_id"]),
        hasBandType: json["has_band_type"],
        hasGeneCycle: json["has_gene_cycle"],
        testLetter: json["test_letter"],
        type: json["type"],
      );
}

class Validity extends ValidityEntity {
  Validity({
    required Id id,
    required String validity,
  }) : super(id: id, validity: validity);

  factory Validity.fromJson(Map<String, dynamic> json) => Validity(
        id: Id.fromJson(json["_id"]),
        validity: json["validity"],
      );
}

class Message extends MessageEntity {
  Message({
    required String text,
    required String type,
  }) : super(text: text, type: type);

  String toJson() => json.encode(toMap());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "type": type,
      };
}
