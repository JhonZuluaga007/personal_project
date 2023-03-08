import 'package:Tellme/features/auth/domain/entities/user_entity_login.dart';
import 'package:either_dart/either.dart';

import '../entities/helper_tools_entity.dart';
import '../entities/change_password_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

abstract class AuthRepository {
  Future<Either<InvalidData, UserEntityLogin>> login(
      String username, String password);
  Future<Either<InvalidData, UserEntityLogin>> getUser();

  /*Future<Either<InvalidData, ServerValidate>> userUpdateEntity(
      UserUpdateEntity userUpdateEntity);*/

  Future<Either<InvalidData, ServerValidate>> resetPassword(String email);
  Future<Either<InvalidData, ServerValidate>> changePassword(
      ChangePasswordEntity changePassword);
  Future<Either<InvalidData, HelperToolsEntity>> getTestools();
}
