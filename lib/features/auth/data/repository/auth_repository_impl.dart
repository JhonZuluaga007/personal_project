import 'package:Tellme/features/auth/domain/entities/user_entity_login.dart';
import 'package:either_dart/either.dart';
import '../data_source/auth_data_source.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/entities/user_update_entity.dart';
import '../../domain/entities/helper_tools_entity.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../../../config/helpers/errors/invalid_data.dart';
import '../../../../config/helpers/models/server_validate_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<InvalidData, UserEntityLogin>> login(
      String username, String password) async {
    try {
      final UserEntityLogin response =
          await authDataSource.login(username, password);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  /*@override
  Future<Either<InvalidData, ServerValidate>> userUpdateEntity(
      UserUpdateEntity userUpdateEntity) async {
    try {
      final ServerValidate response =
          await authDataSource.userUpdateEntity(userUpdateEntity);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }*/

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

  @override
  Future<Either<InvalidData, ServerValidate>> changePassword(
      ChangePasswordEntity changePassword) async {
    try {
      final ServerValidate response =
          await authDataSource.changePassword(changePassword);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }

  @override
  Future<Either<InvalidData, HelperToolsEntity>> getTestools() async {
    try {
      final HelperToolsEntity response = await authDataSource.getTestools();
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
