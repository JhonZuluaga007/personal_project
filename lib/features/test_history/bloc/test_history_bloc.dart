import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_project/config/helpers/injector/injector.dart';
import 'package:personal_project/features/test_history/data/models/test_history_models.dart';
import 'package:personal_project/features/test_history/domain/entities/test_history_entity.dart';
import 'package:personal_project/features/test_history/domain/use_cases/test_history_use_cases.dart';

import '../../../config/helpers/form_submission_status.dart';

part 'test_history_event.dart';
part 'test_history_state.dart';

class TestHistoryBloc extends Bloc<TestHistoryEvent, TestHistoryState> {
  TestHistoryBloc() : super(const TestHistoryState()) {
    final getTestHistoryUseCase = Injector.resolve<TestHistoryUseCases>();
    on<GetHistoryTestEvent>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      final getTestHistoryResponse =
          await getTestHistoryUseCase.call(event.userId);
      getTestHistoryResponse.fold(
          (error) => emit(state.copyWith(
                formStatus:
                    SubmissionFailed(exception: Exception(error.message)),
              )),
          (testHistory) => emit(state.copyWith(
                formStatus: SubmissionSuccess(),
                //TODO CHECK testHistory
              )));
    });
  }
}
