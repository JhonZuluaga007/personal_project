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
              errorMessage: error.message,
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
      emit(state.copyWith(formStatus: FormSubmitting()));
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question1: QuestionTypeOneEntity(
            name: state.question1!.name,
            value: event.question1,
          )));
    });

    on<AntigenQuestion2Event>((event, emit) {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        question2: QuestionTypeTwoEntity(
          name: state.question2!.name,
          value: event.question2,
        ),
      ));
    });

    on<AntigenQuestion3Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question3: QuestionTypeOneEntity(
            name: state.question3!.name,
            value: event.question3,
          )));
    });

    on<AntigenQuestion4Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question4: QuestionTypeOneEntity(
            name: state.question4!.name,
            value: event.question4,
          )));
    });

    on<AntigenQuestion5Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question5: QuestionTypeOneEntity(
            name: state.question5!.name,
            value: event.question5,
          )));
    });

    on<AntigenQuestion6Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question6: QuestionTypeOneEntity(
            name: state.question6!.name,
            value: event.question6,
          )));
    });

    on<AntigenQuestion7Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question7: QuestionTypeOneEntity(
            name: state.question7!.name,
            value: event.question7,
          )));
    });

    on<AntigenQuestion8Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question8: QuestionTypeOneEntity(
            name: state.question8!.name,
            value: event.question8,
          )));
    });

    on<AntigenQuestion9Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question9: QuestionTypeOneEntity(
            name: state.question9!.name,
            value: event.question9,
          )));
    });

    on<AntigenQuestion10Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question10: QuestionTypeTwoEntity(
            name: state.question10!.name,
            value: event.question10,
          )));
    });

    on<AntigenQuestion11Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question11: QuestionTypeTwoEntity(
            name: state.question11!.name,
            value: event.question11,
          )));
    });

    on<AntigenQuestion12Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question12: QuestionTypeTwoEntity(
            name: state.question12!.name,
            value: event.question12,
          )));
    });

    on<AntigenQuestion13Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question13: QuestionTypeOneEntity(
            name: state.question13!.name,
            value: event.question13,
          )));
    });

    on<AntigenQuestion14Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question14: QuestionTypeOneEntity(
            name: state.question14!.name,
            value: event.question14,
          )));
    });

    on<AntigenQuestion15Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question15: QuestionTypeOneEntity(
            name: state.question15!.name,
            value: event.question15,
          )));
    });
  }
}
