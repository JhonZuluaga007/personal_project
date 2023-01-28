import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/config/helpers/models/server_validate_data.dart';
import 'package:personal_project/features/auth/domain/entities/user_entity.dart';
import 'package:personal_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:personal_project/features/auth/domain/entities/user_update_entity.dart';
import 'package:personal_project/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<InvalidData, UserEntity>> login(
      String username, String password) async {
    try {
      final UserEntity response =
          await authDataSource.login(username, password);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, ServerValidate>> userUpdateEntity(
      UserUpdateEntity userUpdateEntity) async {
    try {
      final ServerValidate response =
          await authDataSource.userUpdateEntity(userUpdateEntity);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, ServerValidate>> resetPassword(
      String email) async {
    try {
      final ServerValidate response = await authDataSource.resetPassword(email);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
