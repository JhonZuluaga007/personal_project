part of 'test_history_bloc.dart';

@immutable
abstract class TestHistoryEvent {}

class GetHistoryTestEvent extends TestHistoryEvent {
  final String userId;
  GetHistoryTestEvent(this.userId);
}

class GetViewTestEvent extends TestHistoryEvent {
  final String testId;
  GetViewTestEvent(this.testId);
}
