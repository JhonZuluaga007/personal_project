import 'package:either_dart/either.dart';

import '../entities/user_entity_login.dart';
import '../entities/options_tools_entity.dart';
import '../entities/change_password_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';
import '../entities/user_update_entity.dart';

abstract class AuthRepository {
  Future<Either<InvalidData, UserEntityLogin>> login(
      String username, String password);
  Future<Either<InvalidData, UserEntityLogin>> getUser();

  Future<Either<InvalidData, UserEntityLogin>> userUpdateEntity(
      UserUpdateEntity userUpdateEntity);

  Future<Either<InvalidData, ServerValidate>> resetPassword(String email);
  Future<Either<InvalidData, ServerValidate>> changePassword(
      ChangePasswordEntity changePassword);
  Future<Either<InvalidData, OptionsToolsEntity>> getTestools();
}
