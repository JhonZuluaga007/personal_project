import 'package:either_dart/either.dart';

import '../../domain/repository/auth_repository.dart';
import '../../domain/entities/helper_tools_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class HelperToolsUseCases {
  AuthRepository authRepository;
  HelperToolsUseCases({
    required this.authRepository,
  });

  Future<Either<InvalidData, HelperToolsEntity>> call() async {
    return await authRepository.getTestools();
  }
}
