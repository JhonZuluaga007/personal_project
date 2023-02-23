import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/entities/test_history_entity.dart';
import '../../../config/helpers/injector/injector.dart';
import '../domain/use_cases/test_history_use_cases.dart';
import '../../../config/helpers/form_submission_status.dart';

part 'test_history_event.dart';
part 'test_history_state.dart';

class TestHistoryBloc extends Bloc<TestHistoryEvent, TestHistoryState> {
  TestHistoryBloc() : super(TestHistoryState()) {
    final getTestHistoryUseCase = Injector.resolve<TestHistoryUseCases>();

    on<GetHistoryTestEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final getTestHistoryResponse =
          await getTestHistoryUseCase.call(event.userId);
      getTestHistoryResponse.fold(
          (error) => emit(state.copyWith(
                formStatus:
                    SubmissionFailed(exception: Exception(error.message)),
              )), (testHistory) {
        //TODO: VERIFICATION DATE ALLTESTHISTORY
        final allTestList = testHistory..sort((a, b) => b.sampleDate!.date.compareTo(a.sampleDate!.date));
        final antigenList = testHistory
            .where((antigenTest) => antigenTest.type!.type == 'Antigen')
            .toList()
          ..sort((a, b) => b.sampleDate!.date.compareTo(a.sampleDate!.date));
        final pcrList = testHistory
            .where((pcrTest) => pcrTest.type!.type == 'PCR')
            .toList()
          ..sort((a, b) => b.sampleDate!.date.compareTo(a.sampleDate!.date));

        emit(state.copyWith(
          allTestHistoryList: allTestList,
          antigenTestHistoryList: antigenList,
          pcrTestHistoryList: pcrList,
          formStatus: SubmissionSuccess(),
        ));
      });
    });
  }
}
