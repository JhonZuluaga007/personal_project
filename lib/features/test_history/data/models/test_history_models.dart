import 'dart:convert';

import '../../../antigen/data/models/antigen_model.dart';
import '../../domain/entities/test_history_entity.dart';

class TestHistoryModel extends TestHistoryResponseEntity {
  TestHistoryModel({
    required DataHistory data,
    required MessageHistory message,
    required int statusCode,
  }) : super(data: data, message: message, statusCode: statusCode);

  factory TestHistoryModel.fromJson(String str) =>
      TestHistoryModel.fromMap(json.decode(str));

  factory TestHistoryModel.fromMap(Map<String, dynamic> json) =>
      TestHistoryModel(
        data: DataHistory.fromMap(json["data"]),
        message: MessageHistory.fromMap(json["message"]),
        statusCode: json["statusCode"],
      );
}

class DataHistory extends DataHistoryEntity {
  DataHistory({
    required List<TestHistory> tests,
  }) : super(tests: tests);

  factory DataHistory.fromJson(String str) =>
      DataHistory.fromMap(json.decode(str));

  factory DataHistory.fromMap(Map<String, dynamic> json) => DataHistory(
        tests: List<TestHistory>.from(
            json["tests"].map((x) => TestHistory.fromMap(x))),
      );
}

class TestHistory extends TestHistoryEntity {
  TestHistory({
    required int ic,
    required int n,
    required int orf1Ab,
    required IdHistory id,
    required List<AssociatedTestHistory> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required List<LaboratoryHistory> laboratory,
    required List<ManufacturerAntigen> manufacturer,
    required IdHistory preparedBy,
    required IdHistory project,
    required List<ResultHistory> result,
    required CreatedHistory sampleDate,
    required List<StatusHistory> status,
    required List<StatusTestHistory> statusHistory,
    required List<SwabTypeHistory> swabType,
    required List<dynamic> symptoms,
    required List<TypeHistory> type,
    required CreatedHistory updated,
    required List<dynamic> vaccines,
    required List<ValidityHistory> validity,
    required String vialName,
    required IdHistory form,
    required String photo,
    required List<dynamic> stepHistory,
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
            vaccines: vaccines,
            validity: validity,
            vialName: vialName,
            form: form,
            photo: photo,
            stepHistory: stepHistory);

  factory TestHistory.fromJson(String str) =>
      TestHistory.fromMap(json.decode(str));

  factory TestHistory.fromMap(Map<String, dynamic> json) => TestHistory(
        ic: json["IC"] ?? 0,
        n: json["N"] ?? 0,
        orf1Ab: json["ORF1ab"] ?? 0,
        id: IdHistory.fromMap(json["_id"]),
        associatedTests: List<AssociatedTestHistory>.from(
            json["associated_tests"]
                .map((x) => AssociatedTestHistory.fromMap(x))),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        laboratory: List<LaboratoryHistory>.from(
            json["laboratory"].map((x) => LaboratoryHistory.fromMap(x))),
        manufacturer: List<ManufacturerAntigen>.from(
            json["manufacturer"].map((x) => ManufacturerAntigen.fromMap(x))),
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: List<ResultHistory>.from(
            json["result"].map((x) => ResultHistory.fromMap(x))),
        sampleDate: json["sample_date"].toString().isNotEmpty
            ? CreatedHistory.fromMap(json["sample_date"])
            : CreatedHistory(date: DateTime(2021, 06, 22)),
        status: List<StatusHistory>.from(
            json["status"].map((x) => StatusHistory.fromMap(x))),
        statusHistory: List<StatusTestHistory>.from(
            json["status_history"].map((x) => StatusTestHistory.fromMap(x))),
        swabType: List<SwabTypeHistory>.from(
            json["swab_type"].map((x) => SwabTypeHistory.fromMap(x))),
        symptoms: List<dynamic>.from(json["symptoms"].map((x) => x)),
        type: List<TypeHistory>.from(
            json["type"].map((x) => TypeHistory.fromMap(x))),
        updated: CreatedHistory.fromMap(json["updated"]),
        vaccines: List<dynamic>.from(json["vaccines"].map((x) => x)),
        validity: List<ValidityHistory>.from(
            json["validity"].map((x) => ValidityHistory.fromMap(x))),
        vialName: json["vial_name"] ?? "",
        form: (json["form"] != null && json["form"].toString().isNotEmpty)
            ? IdHistory.fromMap(json["form"])
            : IdHistory(oid: ""),
        photo: json["photo"] ?? '',
        stepHistory: json["step_history"] != null
            ? List<dynamic>.from(json["step_history"].map((x) => x))
            : [],
      );
}

class AssociatedTestHistory extends AssociatedTestEntity {
  AssociatedTestHistory({
    required IdHistory id,
    required List<dynamic> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required IdHistory form,
    required IdHistory manufacturer,
    required String photo,
    required IdHistory preparedBy,
    required IdHistory project,
    required IdHistory result,
    required CreatedHistory sampleDate,
    required IdHistory status,
    required List<StatusTestHistory> statusHistory,
    required List<dynamic> stepHistory,
    required IdHistory swabType,
    required List<IdHistory> symptoms,
    required IdHistory type,
    required CreatedHistory updated,
    required List<dynamic> vaccines,
    required IdHistory validity,
  }) : super(
            id: id,
            associatedTests: associatedTests,
            batch: batch,
            code: code,
            created: created,
            form: form,
            manufacturer: manufacturer,
            photo: photo,
            preparedBy: preparedBy,
            project: project,
            result: result,
            sampleDate: sampleDate,
            status: status,
            statusHistory: statusHistory,
            stepHistory: stepHistory,
            swabType: swabType,
            symptoms: symptoms,
            type: type,
            updated: updated,
            vaccines: vaccines,
            validity: validity);

  factory AssociatedTestHistory.fromJson(String str) =>
      AssociatedTestHistory.fromMap(json.decode(str));

  factory AssociatedTestHistory.fromMap(Map<String, dynamic> json) =>
      AssociatedTestHistory(
        id: IdHistory.fromMap(json["_id"]),
        associatedTests:
            List<dynamic>.from(json["associated_tests"].map((x) => x)),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        form: (json["form"] != null && json["form"].toString().isNotEmpty)
            ? IdHistory.fromMap(json["form"])
            : IdHistory(oid: ""),
        manufacturer: (json["manufacturer"] != null &&
                json["manufacturer"].toString().isNotEmpty)
            ? IdHistory.fromMap(json["manufacturer"])
            : IdHistory(oid: ""),
        photo: json["photo"] ?? '',
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: (json["result"] != null && json["result"].toString().isNotEmpty)
            ? IdHistory.fromMap(json["result"])
            : IdHistory(oid: ""),
        sampleDate: CreatedHistory.fromMap(json["sample_date"]),
        status: IdHistory.fromMap(json["status"]),
        statusHistory: List<StatusTestHistory>.from(
            json["status_history"].map((x) => StatusTestHistory.fromMap(x))),
        stepHistory: json["step_history"] != null
            ? List<dynamic>.from(json["step_history"].map((x) => x))
            : [],
        swabType: json["swab_type"] != null
            ? IdHistory.fromMap(json["swab_type"])
            : IdHistory(oid: ""),
        symptoms:
            (json["symptoms"] != null && json["symptoms"].toString().isNotEmpty)
                ? List<IdHistory>.from(
                    json["symptoms"].map((x) => IdHistory.fromMap(x)))
                : <IdHistory>[],
        type: IdHistory.fromMap(json["type"]),
        updated: CreatedHistory.fromMap(json["updated"]),
        vaccines:
            (json["vaccines"] != null && json["vaccines"].toString().isNotEmpty)
                ? List<dynamic>.from(json["vaccines"].map((x) => x))
                : <dynamic>[],
        validity:
            (json["vaccines"] != null && json["vaccines"].toString().isNotEmpty)
                ? IdHistory.fromMap(json["validity"])
                : IdHistory(oid: ""),
      );
}

class IdHistory extends IdTestEntity {
  IdHistory({
    required String oid,
  }) : super(oid: oid);

  factory IdHistory.fromMap(Map<String, dynamic> json) => IdHistory(
        oid: json["\u0024oid"],
      );
}

class CreatedHistory extends CreatedTestEntity {
  CreatedHistory({
    required DateTime date,
  }) : super(date: date);

  factory CreatedHistory.fromMap(Map<String, dynamic> json) => CreatedHistory(
        date: DateTime.parse(json["\u0024date"]),
      );
}

class StatusTestHistory extends StatusHistoryEntity {
  StatusTestHistory({
    required CreatedHistory date,
    required IdHistory status,
  }) : super(date: date, status: status);

  factory StatusTestHistory.fromMap(Map<String, dynamic> json) =>
      StatusTestHistory(
        date: CreatedHistory.fromMap(json["date"]),
        status: IdHistory.fromMap(json["status"]),
      );
}

class SwabTypeHistory extends SwabTypeHistoryEntity {
  SwabTypeHistory({
    required IdHistory date,
    required String status,
  }) : super(id: date, type: status);

  factory SwabTypeHistory.fromMap(Map<String, dynamic> json) => SwabTypeHistory(
        date: IdHistory.fromMap(json["_id"]),
        status: json["type"],
      );
}

class LaboratoryHistory extends LaboratoryTestEntity {
  LaboratoryHistory({
    required IdHistory id,
    required String name,
    required IdHistory project,
  }) : super(id: id, name: name, project: project);

  factory LaboratoryHistory.fromMap(Map<String, dynamic> json) =>
      LaboratoryHistory(
        id: IdHistory.fromMap(json["_id"]),
        name: json["name"],
        project: IdHistory.fromMap(json["project"]),
      );
}

class ResultHistory extends ResultTestEntity {
  ResultHistory({
    required IdHistory id,
    required String result,
  }) : super(id: id, result: result);

  factory ResultHistory.fromMap(Map<String, dynamic> json) => ResultHistory(
        id: IdHistory.fromMap(json["_id"]),
        result: json["result"],
      );
}

class StatusHistory extends StatusTestEntity {
  StatusHistory({
    required IdHistory id,
    required String status,
  }) : super(id: id, status: status);

  factory StatusHistory.fromMap(Map<String, dynamic> json) => StatusHistory(
        id: json["_id"] != null
            ? IdHistory.fromMap(json["_id"])
            : IdHistory(oid: ""),
        status: json["status"],
      );
}

class TypeHistory extends TypeTestEntity {
  TypeHistory({
    required IdHistory id,
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

  factory TypeHistory.fromMap(Map<String, dynamic> json) => TypeHistory(
        id: IdHistory.fromMap(json["_id"]),
        hasBandType: json["has_band_type"],
        hasGeneCycle: json["has_gene_cycle"],
        testLetter: json["test_letter"],
        type: json["type"],
      );
}

class ValidityHistory extends ValidityTestEntity {
  ValidityHistory({
    required IdHistory id,
    required String validity,
  }) : super(id: id, validity: validity);

  factory ValidityHistory.fromMap(Map<String, dynamic> json) => ValidityHistory(
        id: IdHistory.fromMap(json["_id"]),
        validity: json["validity"],
      );
}

class MessageHistory extends MessageTestEntity {
  MessageHistory({
    required String text,
    required String type,
  }) : super(text: text, type: type);

  factory MessageHistory.fromMap(Map<String, dynamic> json) => MessageHistory(
        text: json["text"],
        type: json["type"],
      );
}
