// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';
import 'package:personal_project/features/auth/domain/entities/user_update_entity.dart';

import '../../../../config/helpers/errors/invalid_data.dart';
import '../repository/auth_repository.dart';

class UserUpdateUseCase {
  AuthRepository authRepository;

  UserUpdateUseCase({
    required this.authRepository,
  });

  Future<Either<InvalidData, ServerValidate>> call(UserUpdateEntity userUpdateEntity) async {
   return await authRepository.userUpdateEntity(userUpdateEntity);
  }
}
