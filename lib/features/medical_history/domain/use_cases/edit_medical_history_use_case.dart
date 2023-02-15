import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';

import '../repository/medical_history_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class EditMedicalHistoryUseCase {
  MedicalHistoryRepository editMedicalHistoryRepo;
  EditMedicalHistoryUseCase({required this.editMedicalHistoryRepo});

  Future<Either<InvalidData, ServerValidate>> editMedicalHistory(
      String userId, String responseOne, List<String> responseTwo) async {
    return await editMedicalHistoryRepo.editMedicalHistory(
        userId, responseOne, responseTwo);
  }
}
