part of 'test_history_bloc.dart';

@immutable
class TestHistoryState {
  final List<TestHistoryEntity> testHistory;

  final FormSubmissionStatus? formStatus;

  const TestHistoryState({
    this.testHistory = const [],
    this.formStatus = const InitialFormStatus(),
  });

  TestHistoryState copyWith({
    FormSubmissionStatus? formStatus,
    List<TestHistoryEntity>? testHistory,
  }) {
    return TestHistoryState(
        formStatus: formStatus ?? this.formStatus,
        testHistory: testHistory ?? this.testHistory);
  }
}
