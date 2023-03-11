import 'package:either_dart/either.dart';

import '../entities/options_tools_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class HelperToolsUseCases {
  AuthRepository authRepository;
  HelperToolsUseCases({
    required this.authRepository,
  });

  Future<Either<InvalidData, OptionsToolsEntity>> call() async {
    return await authRepository.getTestools();
  }
}
