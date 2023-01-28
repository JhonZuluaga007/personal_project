import 'package:either_dart/either.dart';
import 'package:personal_project/features/auth/domain/entities/change_password_entity.dart';
import '../repository/auth_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class ChangePasswordUseCase {
  AuthRepository authRepository;

  ChangePasswordUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, ServerValidate>> call(
      ChangePasswordEntity changePassword) async {
    return await authRepository.changePassword(changePassword);
  }
}
