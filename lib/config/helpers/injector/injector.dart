import 'package:kiwi/kiwi.dart';
import 'package:Tellme/features/antigen/data/data_source/antigen_data_source.dart';
import 'package:Tellme/features/antigen/domain/repository/antigen_repository.dart';
import 'package:Tellme/features/antigen/domain/use_cases/antigen_register_use_case.dart';
import 'package:Tellme/features/antigen/domain/use_cases/antigen_validate_use_case.dart';
import 'package:Tellme/features/medical_history/domain/use_cases/edit_medical_history_use_case.dart';
import 'package:Tellme/features/pcr/data/data_source/pcr_data_source.dart';
import 'package:Tellme/features/pcr/data/repository/pcr_repository_impl.dart';
import 'package:Tellme/features/pcr/domain/repository/pcr_repository.dart';
import 'package:Tellme/features/pcr/domain/use_case/pcr_validate_use_case.dart';

import '../../../features/antigen/data/repository/antigen_repository_impl.dart';

import '../../../features/auth/domain/use_cases/helper_tools_use_cases.dart';
import '../../../features/auth/domain/use_cases/change_password_use_case.dart';
import '../../../features/auth/domain/use_cases/reset_password_use_case.dart';
import '../../../features/auth/domain/use_cases/user_update_use_case.dart';
import '../../../features/medical_history/data/data_source/medical_data_source.dart';
import '../../../features/medical_history/data/repository/medical_history_repository_impl.dart';
import '../../../features/medical_history/domain/repository/medical_history_repository.dart';
import '../../../features/medical_history/domain/use_cases/medical_history_use_case.dart';
import '../../../features/test_history/data/data_source/test_history_data_source.dart';
import '../../../features/test_history/data/repository/test_history_repository_impl.dart';
import '../../../features/test_history/domain/repository/test_history_repository.dart';
import '../../../features/test_history/domain/use_cases/test_history_use_cases.dart';
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
    _configureTestHistoryModule();
    _configureAntigenModule();
    _configurePcrModule();
  }

  void _configureAuthsModule() {
    _configureAuthFactories();
  }

  void _configureMedicalHistoryModule() {
    _configureMedicalHistoryFactories();
  }

  void _configureTestHistoryModule() {
    _configureTestHistoryFactories();
  }

  void _configureAntigenModule() {
    _configureAntigenFactories();
  }

  void _configurePcrModule() {
    _configurePcrFactories();
  }

  @Register.factory(AuthRepository, from: AuthRepositoryImpl)
  @Register.factory(LoginUseCase)
  @Register.factory(AuthDataSource)
  @Register.factory(UserUpdateUseCase)
  @Register.factory(ResetPasswordUseCase)
  @Register.factory(ChangePasswordUseCase)
  @Register.factory(HelperToolsUseCases)
  void _configureAuthFactories();

  @Register.factory(MedicalHistoryRepository,
      from: MedicalHistoryRepositoryImpl)
  @Register.factory(MedicalHistoryUseCase)
  @Register.factory(EditMedicalHistoryUseCase)
  @Register.factory(MedicalHistoryDataSource)
  void _configureMedicalHistoryFactories();

  @Register.factory(TestHistoryRepository, from: TestHistoryRepositoryImpl)
  @Register.factory(TestHistoryUseCases)
  @Register.factory(TestHistoryDataSource)
  void _configureTestHistoryFactories();

  @Register.factory(AntigenRepository, from: AntigenRepositoryImpl)
  @Register.factory(AntigenValidateUseCase)
  @Register.factory(AntigenRegisterUseCase)
  @Register.factory(AntigenDataSource)
  void _configureAntigenFactories();

  @Register.factory(PcrRepository, from: PcrRepositoryImpl)
  @Register.factory(PcrValidateUseCase)
  @Register.factory(PcrDataSource)
  void _configurePcrFactories();
}
