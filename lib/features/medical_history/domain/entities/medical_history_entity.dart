import 'package:Tellme/features/auth/domain/entities/options_tools_entity.dart';

class MedicalHistoryResponseEntity {
  MedicalHistoryResponseEntity({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final DataMedicalHistoryEntity data;
  final MessageMedicalHistoryEntity message;
  final int statusCode;
}

class DataMedicalHistoryEntity {
  DataMedicalHistoryEntity({
    required this.medicalHistory,
  });

  final MedicalHistoryEntity medicalHistory;
}

class MessageMedicalHistoryEntity {
  MessageMedicalHistoryEntity({
    required this.text,
    required this.type,
  });

  final String text;
  final String type;
}

class MedicalHistoryEntity {
  MedicalHistoryEntity({
    required this.id,
    required this.additionalInformation,
    required this.riskFactors,
    required this.user,
  });

  final IdEntity id;
  final bool additionalInformation;
  final List<OpRiskFactorEntity> riskFactors;
  final IdEntity user;
}
