import 'package:either_dart/either.dart';
import 'package:Tellme/features/pcr/domain/repository/pcr_repository.dart';

import '../../../../config/helpers/errors/invalid_data.dart';

class PcrValidateUseCase {
  PcrRepository authRepository;
  PcrValidateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, bool>> callPcr(String userId, String code) async {
    return await authRepository.validatePcr(userId, code);
  }
}
