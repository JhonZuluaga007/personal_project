// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:personal_project/features/auth/domain/entities/user_entity.dart';
import 'package:personal_project/features/auth/domain/use_cases/login_use_case.dart';

import '../../../config/helpers/form_submission_status.dart';
import '../../../config/helpers/injector/injector.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    final loginUseCase = Injector.resolve<LoginUseCase>();

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
          userId: user.user.id,
          statusCode: user.statusCode,
          token: user.token,
        ));
      });
    });
  }
}
