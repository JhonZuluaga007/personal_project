import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_project/config/helpers/form_submission_status.dart';
import 'package:personal_project/features/antigen/domain/use_cases/antigen_validate_use_case.dart';

import '../../../../config/helpers/injector/injector.dart';

part 'antigen_test_event.dart';
part 'antigen_test_state.dart';

class AntigenTestBloc extends Bloc<AntigenTestEvent, AntigenTestState> {
  final antigenUseCase = Injector.resolve<AntigenValidateUseCase>();

  AntigenTestBloc() : super(const AntigenTestState()) {
    on<AntigenValidateEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final getMedicalHistoryResponse =
          await antigenUseCase.callAntigen(event.userId, event.code);
      getMedicalHistoryResponse.fold(
          (error) => emit(state.copyWith(
              formStatus: SubmissionFailed(exception: Exception(error.message)),
              statusCode: state.statusCode)),
          (antigenModel) => emit(state.copyWith(
              code: event.code,
              created: antigenModel.data!.lasttest!.created!.date,
              formStatus: SubmissionSuccess(),
              statusCode: antigenModel.statusCode,
              id: antigenModel.data!.lasttest!.id!.oid,
              idTest: antigenModel.data!.lasttest!.idTest!.oid,
              question1Value: antigenModel.data!.lasttest!.question1!.value,
              question2Value: antigenModel.data!.lasttest!.question2!.value,
              testTime: antigenModel.data!.testTime,
              )));
    });

    on<AntigenQuestion1Event>((event, emit) {
      emit(state.copyWith(question1Value: event.question1));
    });

    on<AntigenQuestion2Event>((event, emit) {
      emit(state.copyWith(question2Value: event.question2));
    });

    on<AntigenQuestion3DateEvent>((event, emit) {
      emit(state.copyWith(question3: event.question3.toString()));
    });
  }
}
