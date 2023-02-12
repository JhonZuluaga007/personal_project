import 'package:either_dart/either.dart';

import '../entities/medical_history_entity.dart';
import '../repository/medical_history_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class MedicalHistoryUseCase {
  MedicalHistoryRepository medicalHistoryRepository;
  MedicalHistoryUseCase({required this.medicalHistoryRepository});

  Future<Either<InvalidData, MedicalHistoryEntity>> call(String userId) async {
    return await medicalHistoryRepository.getMedicalHistory(userId);
  }
}
