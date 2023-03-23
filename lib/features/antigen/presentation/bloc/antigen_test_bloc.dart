import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/antigen_entity.dart';
import '../../../antigen/data/models/antigen_model.dart';
import '../../../../config/helpers/injector/injector.dart';
import '../../domain/use_cases/antigen_validate_use_case.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../auth/domain/entities/options_tools_entity.dart';
import '../../../antigen/domain/entities/antigen_register_entity.dart';
import '../../../antigen/domain/use_cases/antigen_register_use_case.dart';

part 'antigen_test_event.dart';
part 'antigen_test_state.dart';

class AntigenTestBloc extends Bloc<AntigenTestEvent, AntigenTestState> {
  final antigenUseCase = Injector.resolve<AntigenValidateUseCase>();
  final antigenRegisterUseCase = Injector.resolve<AntigenRegisterUseCase>();

  AntigenTestBloc() : super(AntigenTestState()) {
    on<AntigenValidateEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final antigenTest = await antigenUseCase.call(event.code);
      antigenTest.fold(
          (error) => emit(state.copyWith(
              formStatus: SubmissionFailed(exception: Exception(error.message)),
              errorMessage: error.message,
              statusCode: state.statusCode)),
          (antigenModel) => emit(state.copyWith(
                code: event.code,
                created: antigenModel.data.test.created.date,
                formStatus: SubmissionSuccess(),
                statusCode: antigenModel.statusCode,
                id: antigenModel.data.test.id.oid,
                idTest: antigenModel.data.test.id.oid,
                symptoms: antigenModel.data.lastTest!.symptoms,
                vaccines: antigenModel.data.lastTest!.vaccines,
                question1: antigenModel.data.lastTest!.form[0].question1,
                question2: antigenModel.data.lastTest!.form[0].question2,
                question3: antigenModel.data.lastTest!.form[0].question3,
                question4: antigenModel.data.lastTest!.form[0].question4,
                question5: antigenModel.data.lastTest!.form[0].question5,
                question6: antigenModel.data.lastTest!.form[0].question6,
                question7: antigenModel.data.lastTest!.form[0].question7,
                question8: antigenModel.data.lastTest!.form[0].question8,
                question9: antigenModel.data.lastTest!.form[0].question9,
                question10: antigenModel.data.lastTest!.form[0].question10,
                question11: antigenModel.data.lastTest!.form[0].question11,
                question12: antigenModel.data.lastTest!.form[0].question12,
                question13: antigenModel.data.lastTest!.form[0].question13,
                question14: antigenModel.data.lastTest!.form[0].question14,
                question15: antigenModel.data.lastTest!.form[0].question15,
                testTime: antigenModel.data.test.manufacturer[0].testTime,
              )));
    });

    on<AntigenRegisterEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final antigenRegisterTest = await antigenRegisterUseCase.call(
        state.code,
        state.symptoms!,
        state.vaccines!,
        state.question1!,
        state.question2!,
        state.question3!,
        state.question4!,
        state.question5!,
        state.question6!,
        state.question7!,
        state.question8!,
        state.question9!,
        state.question10!,
        state.question11!,
        state.question12!,
        state.question13!,
        state.question14!,
        state.question15!,
        state.stepHistory ?? [],
        state.testImage,
      );
      antigenRegisterTest.fold(
          (error) => emit(state.copyWith(
              formStatus: SubmissionFailed(exception: Exception(error.message)),
              errorMessage: error.message,
              statusCode: state.statusCode)),
          (antigenRegister) => emit(state.copyWith(
              formStatus: SubmissionSuccess(),
              antigenResponse: antigenRegister,
              message: antigenRegister.message.text,
              statusCode: antigenRegister.statusCode)));
    });

    on<AntigenQuestion1Event>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question1: QuestionType1StringEntity(
            name: state.question1!.name,
            value: event.question1!,
          )));
    });

    on<AntigenQuestion2Event>((event, emit) {
      emit(
        state.copyWith(
          formStatus: const InitialFormStatus(),
          question2: QuestionType10List(
            name: state.question2!.name,
            value: event.symptoms.map((e) => e.valor).toList(),
          ),
          symptoms: event.symptoms,
        ),
      );
    });

    on<AntigenQuestion3Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question3: QuestionType1StringEntity(
            name: state.question3!.name,
            value: event.question3,
          )));
    });

    on<AntigenQuestion4Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question4: QuestionType1StringEntity(
            name: state.question4!.name,
            value: event.question4,
          )));
    });

    on<AntigenQuestion5Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question5: QuestionType1StringEntity(
            name: state.question5!.name,
            value: event.question5,
          )));
    });

    on<AntigenQuestion6Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question6: QuestionType1StringEntity(
            name: state.question6!.name,
            value: event.question6,
          )));
    });

    on<AntigenQuestion7Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question7: QuestionType1StringEntity(
            name: state.question7!.name,
            value: event.question7,
          )));
    });

    on<AntigenQuestion8Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question8: QuestionType1StringEntity(
            name: state.question8!.name,
            value: event.question8,
          )));
    });

    on<AntigenQuestion9Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question9: QuestionType1StringEntity(
            name: state.question9!.name,
            value: event.question9,
          )));
    });

    on<AntigenQuestion10Event>((event, emit) {
      emit(
        state.copyWith(
          formStatus: const InitialFormStatus(),
          question10: QuestionType10ListEntity(
            name: state.question10!.name,
            value: event.vaccines.map((vaccine) => vaccine.valor).toList(),
          ),
          vaccines: event.vaccines,
        ),
      );
    });

    on<AntigenQuestion11Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question11: QuestionType10ListEntity(
            name: state.question11!.name,
            value: event.question11,
          )));
    });

    on<AntigenQuestion12Event>((event, emit) {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        question12: QuestionType1StringEntity(
          name: state.question12!.name,
          value: event.question12,
        )));
    });

    on<AntigenQuestion13Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question13: QuestionType1StringEntity(
            name: state.question13!.name,
            value: event.question13,
          )));
    });

    on<AntigenQuestion14Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question14: QuestionType1StringEntity(
            name: state.question14!.name,
            value: event.question14,
          )));
    });

    on<AntigenQuestion15Event>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(),
          question15: QuestionType1StringEntity(
            name: state.question15!.name,
            value: event.question15,
          )));
    });

    on<AntigenImageEvent>((event, emit) {
      emit(state.copyWith(
          formStatus: const InitialFormStatus(), testImage: event.testImage));
    });
  }
}
