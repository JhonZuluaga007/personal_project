import 'package:personal_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:personal_project/features/auth/domain/entities/user_entity.dart';
import 'package:personal_project/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<UserEntity> login(String username, String password) {
    return authDataSource.login(username, password);
  }

}