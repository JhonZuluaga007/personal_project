import 'package:either_dart/either.dart';
import 'package:personal_project/config/helpers/errors/invalid_data.dart';
import 'package:personal_project/features/auth/domain/entities/user_entity.dart';
import 'package:personal_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:personal_project/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<InvalidData, UserEntity>> login(String username, String password) async {

    try {
      final UserEntity response =
      await authDataSource.login(username, password);
      return Right(response);
    } on InvalidData catch (invalidData) {
      return Left(invalidData);
    }
  }
}
