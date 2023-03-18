import 'package:Tellme/features/auth/domain/entities/user_update_entity.dart';
import 'package:either_dart/either.dart';

import '../../../../config/helpers/errors/invalid_data.dart';
import '../entities/user_entity_login.dart';
import '../repository/auth_repository.dart';

class UserUpdateUseCase {
  AuthRepository authRepository;

  UserUpdateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, UserEntityLogin>> call(
      UserUpdateEntity userUpdateEntity) async {
    return await authRepository.userUpdateEntity(userUpdateEntity);
  }
}
