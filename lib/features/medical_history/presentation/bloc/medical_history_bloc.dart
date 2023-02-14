import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_project/features/medical_history/domain/use_cases/edit_medical_history_use_case.dart';

import '../../../../config/helpers/injector/injector.dart';
import '../../domain/entities/medical_history_entity.dart';
import '../../domain/use_cases/medical_history_use_case.dart';
import '../../../../config/helpers/form_submission_status.dart';

part 'medical_history_event.dart';
part 'medical_history_state.dart';

class MedicalHistoryBloc
    extends Bloc<MedicalHistoryEvent, MedicalHistoryState> {
  MedicalHistoryBloc() : super(const MedicalHistoryState()) {
    final getMedicalHistoryUseCase = Injector.resolve<MedicalHistoryUseCase>();
    final editMedicalHistoryUseCase =
        Injector.resolve<EditMedicalHistoryUseCase>();

    on<GetMedicalHistoryEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final getMedicalHistoryResponse =
          await getMedicalHistoryUseCase.call(event.userId);
      getMedicalHistoryResponse.fold(
          (error) => emit(state.copyWith(
                formStatus:
                    SubmissionFailed(exception: Exception(error.message)),
                // errorMessage: error.message, // TODO CHECK
              )),
          (medicalHistory) => emit(state.copyWith(
              userId: medicalHistory.userId,
              formStatus: SubmissionSuccess(),
              status: medicalHistory.status,
              id: medicalHistory.id,
              created: medicalHistory.created,
              updated: medicalHistory.updated,
              question1: medicalHistory.question1,
              question2: medicalHistory.question2)));
    });

    on<EditMedicalHistoryEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final editMedicalHistory =
          await editMedicalHistoryUseCase.editMedicalHistory(
              event.userId, event.responseOne, event.responseTwo);
      editMedicalHistory.fold(
          (error) => emit(state.copyWith(
                formStatus:
                    SubmissionFailed(exception: Exception(error.message)),
                // errorMessage: error.message, // TODO CHECK
              )),
          (medicalHistory) => emit(
                state.copyWith(
                    formStatus: const InitialFormStatus(),
                    infoUploaded: SubmissionSuccess(),
                    question1: Question1Entity(
                        name: 'name', value: event.responseOne)),
              ));
    });
  }
}
