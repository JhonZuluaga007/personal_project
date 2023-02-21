import 'package:either_dart/either.dart';

import '../../data/models/antigen_model.dart';
import '../repository/antigen_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class AntigenValidateUseCase {
  AntigenRepository authRepository;
  AntigenValidateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, AntigenModel>> call(
      String userId, String code) async {
    return await authRepository.validateAntigen(userId, code);
  }
}
