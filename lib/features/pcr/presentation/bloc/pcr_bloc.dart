import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/pcr_test_model.dart';
import '../../domain/use_case/pcr_validate_use_case.dart';
import '../../../../config/helpers/injector/injector.dart';
import '../../../../config/helpers/form_submission_status.dart';

part 'pcr_event.dart';
part 'pcr_state.dart';

class PcrBloc extends Bloc<PcrEvent, PcrState> {
  PcrBloc() : super(PcrState()) {
    final pcrUseCase = Injector.resolve<PcrValidateUseCase>();

    on<PcrValidateEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final getMedicalHistoryResponse =
          await pcrUseCase.callPcr(event.project, event.code);
      getMedicalHistoryResponse.fold(
          (error) => emit(state.copyWith(
              formStatus: SubmissionFailed(exception: Exception(error.message)),
              errorMessage: error.message,
              statusCode: state.statusCode)),
          (pcrSuccess) => emit(state.copyWith(
              formStatus: SubmissionSuccess(),
              testPcr: pcrSuccess
              )));
    });
  }
}
