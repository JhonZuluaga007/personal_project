import 'package:either_dart/either.dart';

import '../repository/auth_repository.dart';
import '../../domain/entities/user_entity_login.dart';
import '../../../../config/helpers/errors/invalid_data.dart';

class GetUserUseCase {
  AuthRepository authRepository;
  GetUserUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, UserEntityLogin>> call() async {
    return await authRepository.getUser();
  }
}
