import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_project/features/test_history/data/models/test_history_models.dart';
import 'package:personal_project/features/test_history/domain/entities/test_history_entity.dart';

part 'test_history_event.dart';
part 'test_history_state.dart';

class TestHistoryBloc extends Bloc<TestHistoryEvent, TestHistoryState> {
  TestHistoryBloc() : super(const TestHistoryState()) {
    on<TestHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
