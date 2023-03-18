import 'package:Tellme/features/auth/data/models/user_model.dart';
import 'package:Tellme/features/auth/domain/entities/options_tools_entity.dart';
import 'package:Tellme/features/auth/domain/entities/user_entity_login.dart';
import 'package:Tellme/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:Tellme/features/test_history/domain/entities/test_history_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_update_entity.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../../../config/helpers/injector/injector.dart';
import '../../domain/use_cases/reset_password_use_case.dart';
import '../../domain/use_cases/change_password_use_case.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../domain/use_cases/user_update_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    final loginUseCase = Injector.resolve<LoginUseCase>();
    final getUserUseCase = Injector.resolve<GetUserUseCase>();
    final userUpdateUseCase = Injector.resolve<UserUpdateUseCase>();
    final resetPasswordUseCase = Injector.resolve<ResetPasswordUseCase>();
    final changePasswordUseCase = Injector.resolve<ChangePasswordUseCase>();

    on<LoginUserE>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final loginResponse =
          await loginUseCase.call(event.userName, event.password);
      loginResponse.fold((error) {
        emit(state.copyWith(
          formStatus: SubmissionFailed(exception: Exception(error.message)),
          errorMessage: error.message,
        ));
      }, (user) {
        final userResponse = user.data.user;
        emit(state.copyWith(
            formStatus: SubmissionSuccess(),
            project: user.data.project.project,
            statusCode: user.statusCode,
            token: user.data.token,
            userId: userResponse.id.oid,
            acceptsTerms: userResponse.acceptsTerms,
            address: userResponse.address.address,
            cellphone: userResponse.cellphone,
            dateOfBirth: userResponse.dateOfBirth,
            email: userResponse.email,
            ethnicity: userResponse.ethnicity.isNotEmpty
                ? userResponse.ethnicity.first
                : EthnicityEntity(id: IdTestEntity(oid: ""), ethnicity: ''),
            firstLogin: userResponse.firstLogin,
            gender: GenderEntity(id: IdTestEntity(oid: ""), gender: ''),
            informationUpdated: userResponse.informationUpdated,
            isActive: userResponse.isActive,
            isConfirmed: userResponse.isConfirmed,
            lastname: userResponse.lastname,
            loginId: userResponse.loginId,
            middleName: userResponse.middleName,
            name: userResponse.name,
            participantId: userResponse.participantId,
            password: userResponse.password,
            passwordReset: userResponse.passwordReset,
            profileImage: userResponse.profileImage,
            projects: userResponse.projects.isNotEmpty
                ? userResponse.projects.first
                : IdTestEntity(oid: ""),
            race: userResponse.race.isNotEmpty
                ? userResponse.race.first
                : RaceEntity(id: IdTestEntity(oid: ""), race: ''),
            roles: userResponse.roles.first,
            // schoolLevels: userResponse.schoolLevels.isNotEmpty
            //     ? userResponse.schoolLevels.first
            //     : IdEntity(oid: ""),
            sex: userResponse.sex.isNotEmpty
                ? userResponse.sex.first
                : SexEntity(
                    id: IdTestEntity(oid: ""),
                    sex: '',
                  )));
      });
    });

    on<GetUser>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final loginResponse = await getUserUseCase.call();
      loginResponse.fold((error) {
        emit(state.copyWith(
          formStatus: SubmissionFailed(exception: Exception(error.message)),
          errorMessage: error.message,
        ));
      }, (user) {
        final userResponse = user.data.user;
        emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          project: user.data.project.project,
          statusCode: user.statusCode,
          token: user.data.token,
          userId: userResponse.id.oid,
          acceptsTerms: userResponse.acceptsTerms,
          address: userResponse.address.address,
          cellphone: userResponse.cellphone,
          dateOfBirth: userResponse.dateOfBirth,
          email: userResponse.email,
          ethnicity: userResponse.ethnicity.isNotEmpty
              ? userResponse.ethnicity.first
              : EthnicityEntity(id: IdTestEntity(oid: ""), ethnicity: ''),
          firstLogin: userResponse.firstLogin,
          gender: GenderEntity(id: IdTestEntity(oid: ""), gender: ''),
          informationUpdated: userResponse.informationUpdated,
          isActive: userResponse.isActive,
          isConfirmed: userResponse.isConfirmed,
          lastname: userResponse.lastname,
          loginId: userResponse.loginId,
          middleName: userResponse.middleName,
          name: userResponse.name,
          participantId: userResponse.participantId,
          password: userResponse.password,
          passwordReset: userResponse.passwordReset,
          profileImage: userResponse.profileImage,
          projects: userResponse.projects.isNotEmpty
              ? userResponse.projects.first
              : IdTestEntity(oid: ''),
          race: userResponse.race.isNotEmpty
              ? userResponse.race.first
              : RaceEntity(id: IdTestEntity(oid: ""), race: ""),
          roles: userResponse.roles.first,
          // schoolLevels: userResponse.schoolLevels.isNotEmpty
          //     ? userResponse.schoolLevels.first
          //     : IdEntity(oid: ""),
          sex: userResponse.sex.isNotEmpty
              ? userResponse.sex.first
              : SexEntity(id: IdTestEntity(oid: ""), sex: ""),
        ));
      });
    });

    on<UpdateImage>((event, emit) => {
      emit(state.copyWith(
        profileImage: event.profileImage
      ))
    });

    on<UserUpdateEvent>((event, emit) {
      userUpdateUseCase.call(event.userUpdateEntity);
      emit(state.copyWith(
        userId: state.userId,
        address: event.userUpdateEntity.address ?? "",
        city: event.userUpdateEntity.city ?? "",
        state: event.userUpdateEntity.state ?? [],
        zip: event.userUpdateEntity.zip ?? "",
        race: event.userUpdateEntity.race,
        ethnicity: event.userUpdateEntity.ethnicity,
        sex: event.userUpdateEntity.sex,
        gender: event.userUpdateEntity.gender,
        profileImage: event.userUpdateEntity.profileImage ?? "",
      ));
    });

    on<ChangePassword>((event, emit) async {
      emit(state.copyWith(formChangePasswordStatus: FormSubmitting()));
      ChangePasswordEntity updatedPassword = ChangePasswordEntity(
          userId: event.userId,
          pass: event.oldPassword,
          newpass: event.newPassword);
      final changePassword = await changePasswordUseCase.authRepository
          .changePassword(updatedPassword);
      changePassword.fold(
          (failed) => {
                emit(
                  state.copyWith(
                    formChangePasswordStatus:
                        SubmissionFailed(exception: Exception(failed.message)),
                    errorMessage: failed.message,
                  ),
                )
              },
          (successfull) => {
                emit(state.copyWith(
                  formChangePasswordStatus: SubmissionSuccess(),
                  statusCode: successfull.statusCode,
                  message: successfull.message,
                ))
              });
    });
    on<SuccessChangePassword>((event, emit) async {
      emit(state.successPasswordChanged(
          formChangePasswordStatus: InitialFormStatus()));
    });

    on<ResetPassword>((event, emit) async {
      emit(state.copyWith(formResetPassword: FormSubmitting()));
      final resetPassword = await resetPasswordUseCase.call(event.email);
      resetPassword.fold((failed) {
        emit(
          state.copyWith(
            formResetPassword:
                SubmissionFailed(exception: Exception(failed.message)),
            errorMessage: failed.message,
          ),
        );
      }, (successful) {
        emit(state.copyWith(
          formResetPassword: SubmissionSuccess(),
          statusCode: successful.statusCode,
          message: successful.message,
        ));
      });
    });

    on<LogOut>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(state.initialState());
    });
  }
}
