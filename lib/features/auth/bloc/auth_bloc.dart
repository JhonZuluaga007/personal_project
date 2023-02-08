// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:personal_project/features/auth/domain/entities/change_password_entity.dart';
import 'package:personal_project/features/auth/domain/use_cases/change_password_use_case.dart';
import '../domain/entities/user_entity.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/entities/user_update_entity.dart';
import '../domain/use_cases/user_update_use_case.dart';
import '../domain/use_cases/reset_password_use_case.dart';
import '../../../config/helpers/injector/injector.dart';
import '../../../config/helpers/form_submission_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    final loginUseCase = Injector.resolve<LoginUseCase>();
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
        emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          statusCode: user.statusCode,
          //birthDate: user.user.dateOfBirth,
          token: user.token,
          userId: user.user.id,
          address: user.user.addresses!.address,
          city: user.user.addresses!.city,
          state: user.user.addresses!.state,
          zip: user.user.addresses!.zip,
          cellphone: user.user.cellphone,
          email: user.user.email,
          ethnicity: user.user.ethnicity!.isNotEmpty
              ? user.user.ethnicity![0]!.ethnicity
              : '',
          gender:
              user.user.gender!.isNotEmpty ? user.user.gender![0]!.gender : '',
          //Simage: user.user.image,
          informationUpdated: user.user.informationUpdated,
          isActive: user.user.isActive,
          isConfirmed: user.user.isConfirmed,
          lastname: user.user.lastname,
          loginId: user.user.loginId,
          middleName: user.user.middleName,
          name: user.user.name,
          organization: user.user.organization,
          participantId: user.user.participantId,
          levelSchool: user.user.levelSchool,
          race: user.user.race!.isNotEmpty ? user.user.race![0]!.race : '',
          sex: user.user.sex!.isNotEmpty ? user.user.sex![0]!.sex : '',
        ));
      });
    });

    on<UserUpdateEvent>((event, emit) {
      emit(state.copyWith(
          userId: state.userId,
          address: event.userUpdateEntity.address,
          city: event.userUpdateEntity.city,
          state: event.userUpdateEntity.state,
          zip: event.userUpdateEntity.zip,
          race: event.userUpdateEntity.race,
          ethnicity: event.userUpdateEntity.ethnicity,
          sex: event.userUpdateEntity.sex,
          gender: event.userUpdateEntity.gender,
          image: event.userUpdateEntity.file));
      userUpdateUseCase.call(event.userUpdateEntity);
    });
    on<ChangePassword>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
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
                    formStatus:
                        SubmissionFailed(exception: Exception(failed.message)),
                    errorMessage: failed.message,
                  ),
                )
              },
          (successfull) => {
                emit(state.copyWith(
                    formStatus: SubmissionSuccess(),
                    statusCode: successfull.statusCode,
                    message: successfull.message))
              });
    });
    on<ResetPassword>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final resetPassword = await resetPasswordUseCase.call(event.email);
      resetPassword.fold((failed) {
        emit(
          state.copyWith(
            formStatus: SubmissionFailed(exception: Exception(failed.message)),
            errorMessage: failed.message,
          ),
        );
      }, (successful) {
        emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          statusCode: successful.statusCode,
          message: successful.message,
        ));
      });
    });
  }
}
