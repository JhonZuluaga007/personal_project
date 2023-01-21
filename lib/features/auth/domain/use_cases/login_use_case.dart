
import '../entities/user_entity.dart';
import 'package:either_dart/either.dart';
import '../repository/auth_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, UserEntity>> call(
      String username, String password) async {
   return await authRepository.login(username, password);
  }
}