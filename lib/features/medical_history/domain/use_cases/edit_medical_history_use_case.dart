import 'package:either_dart/either.dart';

import '../entities/medical_history_entity.dart';
import '../repository/medical_history_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class EditMedicalHistoryUseCase {
  MedicalHistoryRepository editMedicalHistoryRepo;
  EditMedicalHistoryUseCase({required this.editMedicalHistoryRepo});

  Future<Either<InvalidData, MedicalHistoryResponseEntity>> editMedicalHistory(
      bool responseOne, List<String> responseTwo) async {
    return await editMedicalHistoryRepo.editMedicalHistory(
        responseOne, responseTwo);
  }
}
