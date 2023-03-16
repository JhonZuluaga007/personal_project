import 'package:either_dart/either.dart';

import '../entities/antigen_entity.dart';
import '../repository/antigen_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class AntigenValidateUseCase {
  AntigenRepository authRepository;
  AntigenValidateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, AntigenResponseEntity>> call(String code) async {
    return await authRepository.validateAntigen(code);
  }
}
