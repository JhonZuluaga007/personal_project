import 'package:either_dart/either.dart';

import '../entities/medical_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

abstract class MedicalHistoryRepository {
  Future<Either<InvalidData, MedicalHistoryResponseEntity>> getMedicalHistory();

  Future<Either<InvalidData, MedicalHistoryResponseEntity>> editMedicalHistory(
      bool responseOne, List<String> responseTwo);
}
