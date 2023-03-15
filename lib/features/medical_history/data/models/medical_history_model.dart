import '../../domain/entities/medical_history_entity.dart';
import '../../../auth/data/models/options_tools_model.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';

class MedicalHistoryModel extends MedicalHistoryResponseEntity {
  MedicalHistoryModel({
    required Data data,
    required Message message,
    required int statusCode,
  }) : super(data: data, message: message, statusCode: statusCode);

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      MedicalHistoryModel(
        data: Data.fromJson(json["data"]),
        message: Message.fromJson(json["message"]),
        statusCode: json["statusCode"],
      );
}

class Data extends DataMedicalHistoryEntity {
  Data({
    required MedicalHistory medicalHistory,
  }) : super(medicalHistory: medicalHistory);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        medicalHistory: MedicalHistory.fromJson(json["medical_history"]),
      );
}

class MedicalHistory extends MedicalHistoryEntity {
  MedicalHistory({
    required Id id,
    required bool additionalInformation,
    required List<RiskFactor> riskFactors,
    required Id user,
  }) : super(
            id: id,
            additionalInformation: additionalInformation,
            riskFactors: riskFactors,
            user: user);

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
        id: Id.fromJson(json["_id"]),
        additionalInformation: json["additional_information"],
        riskFactors: List<RiskFactor>.from(
            json["risk_factors"].map((x) => RiskFactor.fromJson(x))),
        user: Id.fromJson(json["user"]),
      );
}

class Id extends IdEntity {
  Id({
    required String oid,
  }) : super(
          oid: oid,
        );

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class Message extends MessageMedicalHistoryEntity {
  Message({
    required String text,
    required String type,
  }) : super(text: text, type: type);

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json["text"],
        type: json["type"],
      );
}
