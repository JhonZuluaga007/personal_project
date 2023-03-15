import 'package:Tellme/features/auth/domain/entities/options_tools_entity.dart';
import 'package:either_dart/either.dart';

import '../entities/medical_history_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

abstract class MedicalHistoryRepository {
  Future<Either<InvalidData, MedicalHistoryResponseEntity>> getMedicalHistory();

  Future<Either<InvalidData, MedicalHistoryResponseEntity>> editMedicalHistory(
      bool responseOne, List<String> responseTwo);
}
