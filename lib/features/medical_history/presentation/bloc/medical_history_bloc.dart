import 'package:Tellme/features/medical_history/data/models/medical_history_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:Tellme/features/medical_history/domain/use_cases/edit_medical_history_use_case.dart';

import '../../../../config/helpers/injector/injector.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';
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
      final getMedicalHistoryResponse = await getMedicalHistoryUseCase.call();
      getMedicalHistoryResponse.fold(
          (error) => emit(state.copyWith(
                formStatus:
                    SubmissionFailed(exception: Exception(error.message)),
              )),
          (medicalHistory) => emit(state.copyWith(
                question1: medicalHistory.data.medicalHistory.additionalInformation,
                question2: medicalHistory.data.medicalHistory.riskFactors,
                formStatus: SubmissionSuccess(),
              )));
    });

    // on<EditMedicalHistoryEvent>((event, emit) async {
    //   emit(state.copyWith(
    //     infoUploaded: FormSubmitting(),
    //   ));
    //   final editMedicalHistory =
    //       await editMedicalHistoryUseCase.editMedicalHistory(
    //           event.userId, event.responseOne, event.responseTwo);
    //   editMedicalHistory.fold(
    //       (error) => emit(state.copyWith(
    //             infoUploaded: SubmissionFailed(
    //               exception: Exception(error.message),
    //             ),
    //             errorMessage: error.message, // TODO CHECK
    //           )), (medicalHistory) {
    //     emit(
    //       state.copyWith(
    //         infoUploaded: SubmissionSuccess(),
    //         question1: Question1Entity(
    //           name: state.question1!.name,
    //           value: event.responseOne,
    //         ),
    //         question2: Question2Entity(
    //           name: state.question2!.name,
    //           value: event.responseTwo,
    //         ),
    //       ),
    //     );
    //   });
    //   add(ResetStatesMedicalHistoryEvent());
    // });

    on<ResetStatesMedicalHistoryEvent>((event, emit) async {
      emit(state.initialState());
    });
  }
}
