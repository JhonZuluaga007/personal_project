import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';
import 'package:personal_project/features/auth/domain/entities/user_entity.dart';
import 'package:personal_project/features/auth/domain/entities/user_update_entity.dart';

abstract class AuthRepository {
  Future<Either<InvalidData, UserEntity>> login(String username, String password);

  Future<Either<InvalidData, ServerValidate>> userUpdateEntity(UserUpdateEntity userUpdateEntity);
}
