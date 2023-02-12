import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';
import 'package:personal_project/features/medical_history/domain/entities/medical_history_entity.dart';

abstract class MedicalHistoryRepository {
  Future<Either<InvalidData, MedicalHistoryEntity>> getMedicalHistory(
      String id);

  Future<Either<InvalidData, ServerValidate>> editMedicalHistory(
      String userId, String responseOne, List<String> responseTwo);
}
