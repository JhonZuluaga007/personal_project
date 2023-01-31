import '../../domain/entities/test_history_entity.dart';

class HistoryTestModel {
  HistoryTestModel({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final List<Data> data;
  final String message;
  final int statusCode;

  factory HistoryTestModel.fromJson(Map<String, dynamic> json) =>
      HistoryTestModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        message: json["message"],
        statusCode: json["statusCode"],
      );
}

class Data extends TestHistoryEntity {
  Data({
    required Id id,
    required Id batch,
    required String code,
    required Created created,
    required Id form,
    required Id manufacturer,
    required List<String> photo,
    required List<Result> result,
    required Created sampleDate,
    required Status status,
    required List<StatusHistory> statusHistory,
    required String stepHistory,
    required Id swabType,
    required Type type,
    required Created updated,
    required Id user,
    required List<Validity> validity,
  }) : super(
          id: id,
          batch: batch,
          code: code,
          created: created,
          form: form,
          manufacturer: manufacturer,
          photo: photo,
          result: result,
          sampleDate: sampleDate,
          status: status,
          statusHistory: statusHistory,
          stepHistory: stepHistory,
          swabType: swabType,
          type: type,
          updated: updated,
          user: user,
          validity: validity,
        );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: Id.fromJson(json["_id"]),
        batch: Id.fromJson(json["batch"]),
        code: json["code"],
        created: Created.fromJson(json["created"]),
        form: Id.fromJson(json["form"]),
        manufacturer: Id.fromJson(json["manufacturer"]),
        photo: List<String>.from(json["photo"].map((x) => x)),
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        sampleDate: Created.fromJson(json["sample_date"]),
        status: Status.fromJson(json["status"]),
        statusHistory: List<StatusHistory>.from(
            json["status_history"].map((x) => StatusHistory.fromJson(x))),
        stepHistory: json["step_history"],
        swabType: Id.fromJson(json["swab_type"]),
        type: Type.fromJson(json["type"]),
        updated: Created.fromJson(json["updated"]),
        user: Id.fromJson(json["user"]),
        validity: List<Validity>.from(
            json["validity"].map((x) => Validity.fromJson(x))),
      );
}

class Id extends IdEntity {
  Id({
    required String oid,
  }) : super(oid: oid);

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );
}

class Created extends CreatedEntity {
  Created({
    required DateTime date,
  }) : super(date: date);

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date.toIso8601String(),
      };
}

class Result extends ResultEntity {
  Result({
    required Id id,
    required String result,
  }) : super(
          id: id,
          result: result,
        );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: Id.fromJson(json["_id"]),
        result: json["result"],
      );
}

class Status extends StatusEntity {
  Status({
    required Id id,
    required String status,
  }) : super(
          id: id,
          status: status,
        );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: Id.fromJson(json["_id"]),
        status: json["status"],
      );
}

class StatusHistory extends StatusHistoryEntity {
  StatusHistory({
    required Created date,
    required Id status,
  }) : super(
          date: date,
          status: status,
        );

  factory StatusHistory.fromJson(Map<String, dynamic> json) => StatusHistory(
        date: Created.fromJson(json["date"]),
        status: Id.fromJson(json["status"]),
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
          type: type,
        );

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
  }) : super(
          id: id,
          validity: validity,
        );

  factory Validity.fromJson(Map<String, dynamic> json) => Validity(
        id: Id.fromJson(json["_id"]),
        validity: json["validity"],
      );
}
