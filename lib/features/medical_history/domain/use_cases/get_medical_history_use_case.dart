import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/features/medical_history/domain/entities/medical_history_entity.dart';
import 'package:personal_project/features/medical_history/domain/repository/medical_history_repository.dart';

class MedicalHistoryUseCase {
  MedicalHistoryRepository medicalHistoryRepository;
  MedicalHistoryUseCase({required this.medicalHistoryRepository});

  Future<Either<InvalidData, MedicalHistoryEntity>> call(String userId) async {
    return await medicalHistoryRepository.getMedicalHistory(userId);
  }
}
