import 'package:either_dart/either.dart';
import 'package:personal_project/features/antigen/domain/repository/antigen_repository.dart';
import 'package:personal_project/features/antigen/data/models/antigen_model.dart';

import '../../../../config/helpers/errors/invalid_data.dart';

class AntigenValidateUseCase {
  AntigenRepository authRepository;
  AntigenValidateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, AntigenModel>> callAntigen(
      String userId, String code) async {
    return await authRepository.validateAntigen(userId, code);
  }
}