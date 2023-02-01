import 'package:kiwi/kiwi.dart';
import 'package:personal_project/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:personal_project/features/auth/domain/use_cases/user_update_use_case.dart';
import 'package:personal_project/features/medical_history/data/data_source/medical_data_source.dart';
import 'package:personal_project/features/medical_history/data/repository/medical_history_repository_impl.dart';
import 'package:personal_project/features/medical_history/domain/repository/medical_history_repository.dart';
import 'package:personal_project/features/medical_history/domain/use_cases/get_medical_history_use_case.dart';

import '../../../features/auth/data/data_source/auth_data_source.dart';
import '../../../features/auth/data/repository/auth_repository_impl.dart';
import '../../../features/auth/domain/repository/auth_repository.dart';
import '../../../features/auth/domain/use_cases/login_use_case.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();
  static void setup() {
    var injector = _$Injector();
    injector._configure();
  }

  static final resolve = container.resolve;

  //The repositories and their implementation, the use case and the datasource must always be registered.
  //If two or more use cases depend on the same repositories and datasource, only the new use case should be registered, since the rest will already be registered.

  //When you finish registering the new use case, you must run the following command in the console
  // flutter packages pub run build_runner build
  //If it fails, you must run the following command
  // flutter packages pub run build_runner build --delete-conflicting-outputs
  //The second command will overwrite the injector.g.dart file if necessary

  //A new factory configuration must be created every time there is a new repository and datasource.

  void _configure() {
    _configureAuthsModule();
    _configureMedicalHistoryModule();
  }

  void _configureAuthsModule() {
    _configureAuthFactories();
  }

  void _configureMedicalHistoryModule() {
    _configureMedicalHistoryFactories();
  }

  @Register.factory(AuthRepository, from: AuthRepositoryImpl)
  @Register.factory(LoginUseCase)
  @Register.factory(AuthDataSource)
  @Register.factory(UserUpdateUseCase)
  @Register.factory(ResetPasswordUseCase)
  void _configureAuthFactories();

  @Register.factory(MedicalHistoryRepository,
      from: MedicalHistoryRepositoryImpl)
  @Register.factory(MedicalHistoryUseCase)
  @Register.factory(MedicalHistoryDataSource)
  void _configureMedicalHistoryFactories();
}
