import 'package:either_dart/either.dart';

import '../repository/auth_repository.dart';
import '../../domain/entities/user_entity_login.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, UserEntityLogin>> call(
      String username, String password) async {
    return await authRepository.login(username, password);
  }
}
