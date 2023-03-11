import '../repository/auth_repository.dart';

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
