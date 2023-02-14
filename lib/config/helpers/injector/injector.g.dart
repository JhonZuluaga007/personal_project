// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureAuthFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<AuthRepository>(
          (c) => AuthRepositoryImpl(authDataSource: c<AuthDataSource>()))
      ..registerFactory(
          (c) => LoginUseCase(authRepository: c<AuthRepository>()))
      ..registerFactory((c) => AuthDataSource())
      ..registerFactory(
          (c) => UserUpdateUseCase(authRepository: c<AuthRepository>()))
      ..registerFactory(
          (c) => ResetPasswordUseCase(authRepository: c<AuthRepository>()))
      ..registerFactory(
          (c) => ChangePasswordUseCase(authRepository: c<AuthRepository>()));
  }

  @override
  void _configureMedicalHistoryFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<MedicalHistoryRepository>((c) =>
          MedicalHistoryRepositoryImpl(
              medicalHistoryDataSource: c<MedicalHistoryDataSource>()))
      ..registerFactory((c) => MedicalHistoryUseCase(
          medicalHistoryRepository: c<MedicalHistoryRepository>()))
      ..registerFactory((c) => EditMedicalHistoryUseCase(
          editMedicalHistoryRepo: c<MedicalHistoryRepository>()))
      ..registerFactory((c) => MedicalHistoryDataSource());
  }

  @override
  void _configureTestHistoryFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<TestHistoryRepository>((c) => TestHistoryRepositoryImpl(
          testHistoryDataSource: c<TestHistoryDataSource>()))
      ..registerFactory((c) => TestHistoryUseCases(
          testHistoryRepository: c<TestHistoryRepository>()))
      ..registerFactory((c) => TestHistoryDataSource());
  }
}
