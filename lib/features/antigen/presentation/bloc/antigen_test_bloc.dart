import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/antigen_entity.dart';
import '../../../../config/helpers/injector/injector.dart';
import '../../domain/use_cases/antigen_validate_use_case.dart';
import '../../../../config/helpers/form_submission_status.dart';

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
                question1: antigenModel.data!.lasttest!.question1!,
                question2: antigenModel.data!.lasttest!.question2!,
                question3: antigenModel.data!.lasttest!.question3!,
                question4: antigenModel.data!.lasttest!.question4!,
                question5: antigenModel.data!.lasttest!.question5!,
                question6: antigenModel.data!.lasttest!.question6!,
                question7: antigenModel.data!.lasttest!.question7!,
                question8: antigenModel.data!.lasttest!.question8!,
                question9: antigenModel.data!.lasttest!.question9!,
                question10: antigenModel.data!.lasttest!.question10!,
                question11: antigenModel.data!.lasttest!.question11!,
                question12: antigenModel.data!.lasttest!.question12!,
                question13: antigenModel.data!.lasttest!.question13!,
                question14: antigenModel.data!.lasttest!.question14!,
                question15: antigenModel.data!.lasttest!.question15!,
                testTime: antigenModel.data!.testTime,
              )));
    });

    on<AntigenQuestion1Event>((event, emit) async {
      emit(state.copyWith(
          question1: QuestionTypeOneEntity(
        name: state.question1!.name,
        value: event.question1,
      )));
    });

    on<AntigenQuestion2Event>((event, emit) {
      emit(state.copyWith(question2: event.question2));
    });

    on<AntigenQuestion3Event>((event, emit) {
      emit(state.copyWith(question3: event.question3));
    });
  }
}
