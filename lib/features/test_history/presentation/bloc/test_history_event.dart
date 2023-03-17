part of 'test_history_bloc.dart';

@immutable
abstract class TestHistoryEvent {}

class GetHistoryTestEvent extends TestHistoryEvent {
  GetHistoryTestEvent();
}
