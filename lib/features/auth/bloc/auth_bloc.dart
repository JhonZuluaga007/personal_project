// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:personal_project/features/auth/domain/entities/user_entity.dart';

import '../domain/use_cases/login_use_case.dart';
import '../../../config/helpers/injector/injector.dart';
import '../../../config/helpers/form_submission_status.dart';

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
          statusCode: user.statusCode,
          birthDate: user.user.dateOfBirth,
          token: user.token,
          userId: user.user.id,
          address: user.user.addresses!.address,
          city: user.user.addresses!.city,
          state: user.user.addresses!.state,
          zip: user.user.addresses!.zip,
          cellphone: user.user.cellphone,
          email: user.user.email,
          ethnicity: user.user.ethnicity![0]!.ethnicity ?? '',
          gender: user.user.gender![0]!.gender ?? '',
          image: user.user.image,
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
          race: user.user.race![0]!.race,
          sex: user.user.sex![0]!.sex,
        ));
      });
    });
  }
}
