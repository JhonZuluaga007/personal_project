// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:either_dart/either.dart';
import '../repository/auth_repository.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, ServerValidate>> call(String email) async {
    return await authRepository.resetPassword(email);
  }
}
