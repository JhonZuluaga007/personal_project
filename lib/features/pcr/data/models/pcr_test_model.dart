import 'package:Tellme/features/pcr/domain/entities/pcr_test_entities.dart';
import 'package:Tellme/features/test_history/data/models/test_history_models.dart';

class PcrTestModel {
  PcrTestModel({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final Data data;
  final MessageHistory message;
  final int statusCode;

  factory PcrTestModel.fromMap(Map<String, dynamic> json) => PcrTestModel(
        data: Data.fromMap(json["data"]),
        message: MessageHistory.fromMap(json["message"]),
        statusCode: json["statusCode"],
      );
}

class Data {
  Data({
    required this.test,
  });

  final Test test;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        test: Test.fromMap(json["test"]),
      );
}

class Test extends TestPcrEntity {
  Test({
    required int ic,
    required int n,
    required int orf1Ab,
    required IdHistory id,
    required List<AssociatedTest> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required List<dynamic> laboratory,
    required List<dynamic> manufacturer,
    required IdHistory preparedBy,
    required IdHistory project,
    required List<dynamic> result,
    required CreatedHistory sampleDate,
    required List<StatusHistory> status,
    required List<StatusTestHistory> statusHistory,
    required List<dynamic> swabType,
    required List<dynamic> symptoms,
    required List<TypeHistory> type,
    required CreatedHistory updated,
    required List<dynamic> vaccines,
    required List<dynamic> validity,
    required String vialName,
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
            vialName: vialName);

  factory Test.fromMap(Map<String, dynamic> json) => Test(
        ic: json["IC"],
        n: json["N"],
        orf1Ab: json["ORF1ab"],
        id: json["_id"] != null ? IdHistory.fromMap(json["_id"]) : IdHistory(oid: ""),
        associatedTests: List<AssociatedTest>.from(
            json["associated_tests"].map((x) => AssociatedTest.fromMap(x))),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        laboratory: List<dynamic>.from(json["laboratory"].map((x) => x)),
        manufacturer: List<dynamic>.from(json["manufacturer"].map((x) => x)),
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: List<ResultHistory>.from(json["result"].map((x) => x)),
        sampleDate: CreatedHistory.fromMap(json["sample_date"]),
        status: json["status"] != null
            ? List<StatusHistory>.from(json["status"].map((x) => StatusHistory.fromMap(x)))
            : [],
        statusHistory: json["status_history"] != null
            ? List<StatusTestHistory>.from(
                json["status_history"].map((x) => StatusTestHistory.fromMap(x)))
            : [],
        swabType: List<dynamic>.from(json["swab_type"].map((x) => x)),
        symptoms: List<dynamic>.from(json["symptoms"].map((x) => x)),
        type: List<TypeHistory>.from(
            json["type"].map((x) => TypeHistory.fromMap(x))),
        updated: CreatedHistory.fromMap(json["updated"]),
        validity: List<ValidityHistory>.from(json["validity"].map((x) => x)),
        vialName: json["vial_name"],
        vaccines: List<dynamic>.from(json["vaccines"].map((x) => x)),
      );
}

class AssociatedTest extends AssociatedPcrEntity {
  AssociatedTest({
    required IdHistory id,
    required List<dynamic> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required IdHistory form,
    required String manufacturer,
    required List<String> photo,
    required IdHistory preparedBy,
    required IdHistory project,
    required IdHistory result,
    required CreatedHistory sampleDate,
    required IdHistory status,
    required List<StatusTestHistory> statusHistory,
    required List<dynamic> stepHistory,
    required String swabType,
    required List<IdHistory> symptoms,
    required IdHistory type,
    required CreatedHistory updated,
    required List<IdHistory> vaccines,
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

  factory AssociatedTest.fromMap(Map<String, dynamic> json) => AssociatedTest(
        id: IdHistory.fromMap(json["_id"]),
        associatedTests:
            List<dynamic>.from(json["associated_tests"].map((x) => x)),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        form: IdHistory.fromMap(json["form"]),
        manufacturer: json["manufacturer"],
        photo: List<String>.from(json["photo"].map((x) => x)),
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: IdHistory.fromMap(json["result"]),
        sampleDate: CreatedHistory.fromMap(json["sample_date"]),
        status: IdHistory.fromMap(json["status"]),
        statusHistory: List<StatusTestHistory>.from(
            json["status_history"].map((x) => StatusTestHistory.fromMap(x))),
        stepHistory: List<dynamic>.from(json["step_history"].map((x) => x)),
        swabType: json["swab_type"],
        symptoms: List<IdHistory>.from(
            json["symptoms"].map((x) => IdHistory.fromMap(x))),
        type: IdHistory.fromMap(json["type"]),
        updated: CreatedHistory.fromMap(json["updated"]),
        vaccines: List<IdHistory>.from(
            json["vaccines"].map((x) => IdHistory.fromMap(x))),
        validity: IdHistory.fromMap(json["validity"]),
      );
}
