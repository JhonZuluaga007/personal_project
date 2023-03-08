import 'package:either_dart/either.dart';
import '../repository/auth_repository.dart';
import '../entities/user_update_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class UserUpdateUseCase {
  AuthRepository authRepository;

  UserUpdateUseCase({
    required this.authRepository,
  });

  /*Future<Either<InvalidData, ServerValidate>> call(
      UserUpdateEntity userUpdateEntity) async {
    return await authRepository.userUpdateEntity(userUpdateEntity);
  }*/
}
