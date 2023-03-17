import 'antigen_model.dart';
import '../../domain/entities/antigen_register_entity.dart';
import '../../../test_history/data/models/test_history_models.dart';

class AntigenRegisterModel extends AntigenRegisterResponseEntity {
  AntigenRegisterModel({
    required DataRegisterAntigen data,
    required MessageHistory message,
    required int statusCode,
  }) : super(data: data, message: message, statusCode: statusCode);

  factory AntigenRegisterModel.fromMap(Map<String, dynamic> json) =>
      AntigenRegisterModel(
        data: DataRegisterAntigen.fromMap(json["data"]),
        message: MessageHistory.fromMap(json["message"]),
        statusCode: json["statusCode"],
      );
}

class DataRegisterAntigen extends DataRegisterAntigenEntity {
  DataRegisterAntigen({
    required TestRegisterAntigen test,
  }) : super(test: test);

  factory DataRegisterAntigen.fromMap(Map<String, dynamic> json) =>
      DataRegisterAntigen(
        test: TestRegisterAntigen.fromMap(json["test"]),
      );
}

class TestRegisterAntigen extends TestRegisterAntigenEntity {
  TestRegisterAntigen({
    required IdHistory id,
    required List<dynamic> associatedTests,
    required IdHistory batch,
    required String code,
    required CreatedHistory created,
    required IdHistory form,
    required List<dynamic> laboratory,
    required List<ManufacturerAntigen> manufacturer,
    required List<dynamic> photo,
    required IdHistory preparedBy,
    required IdHistory project,
    required List<ResultHistory> result,
    required CreatedHistory sampleDate,
    required List<StatusHistory> status,
    required List<StatusTestHistory> statusHistory,
    required List<dynamic> stepHistory,
    required List<dynamic> swabType,
    required List<dynamic> symptoms,
    required List<TypeHistory> type,
    required CreatedHistory updated,
    required List<dynamic> vaccines,
    required List<dynamic> validity,
  }) : super(
            id: id,
            associatedTests: associatedTests,
            batch: batch,
            code: code,
            created: created,
            form: form,
            laboratory: laboratory,
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

  factory TestRegisterAntigen.fromMap(Map<String, dynamic> json) =>
      TestRegisterAntigen(
        id: IdHistory.fromMap(json["_id"]),
        associatedTests:
            List<dynamic>.from(json["associated_tests"].map((x) => x)),
        batch: IdHistory.fromMap(json["batch"]),
        code: json["code"],
        created: CreatedHistory.fromMap(json["created"]),
        form: IdHistory.fromMap(json["form"]),
        laboratory: List<dynamic>.from(json["laboratory"].map((x) => x)),
        manufacturer: List<ManufacturerAntigen>.from(
            json["manufacturer"].map((x) => ManufacturerAntigen.fromMap(x))),
        photo: List<dynamic>.from(json["photo"].map((x) => x)),
        preparedBy: IdHistory.fromMap(json["prepared_by"]),
        project: IdHistory.fromMap(json["project"]),
        result: List<ResultHistory>.from(
            json["result"].map((x) => ResultHistory.fromMap(x))),
        sampleDate: CreatedHistory.fromMap(json["sample_date"]),
        status: List<StatusHistory>.from(
            json["status"].map((x) => StatusHistory.fromMap(x))),
        statusHistory: List<StatusTestHistory>.from(
            json["status_history"].map((x) => StatusTestHistory.fromMap(x))),
        stepHistory: List<dynamic>.from(json["validity"].map((x) => x)),
        swabType: List<dynamic>.from(json["swab_type"].map((x) => x)),
        symptoms: List<dynamic>.from(json["symptoms"].map((x) => x)),
        type: List<TypeHistory>.from(
            json["type"].map((x) => TypeHistory.fromMap(x))),
        updated: CreatedHistory.fromMap(json["updated"]),
        vaccines: List<dynamic>.from(json["vaccines"].map((x) => x)),
        validity: List<dynamic>.from(json["validity"].map((x) => x)),
      );
}
