import 'package:either_dart/either.dart';

import '../../data/models/pcr_test_model.dart';
import '../../domain/repository/pcr_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class PcrValidateUseCase {
  PcrRepository authRepository;
  PcrValidateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, PcrTestModel>> callPcr(
      String userId, String code) async {
    return await authRepository.validatePcr(userId, code);
  }
}
