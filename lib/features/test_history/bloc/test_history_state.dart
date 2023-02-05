// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'test_history_bloc.dart';

@immutable
class TestHistoryState {
  final List<TestHistoryEntity> testHistory;
  final List<TestViewEntity> testView;

  final FormSubmissionStatus? formStatus;

  const TestHistoryState({
    this.testHistory = const [],
    this.formStatus = const InitialFormStatus(),
    this.testView = const [],
  });

  TestHistoryState copyWith({
    List<TestHistoryEntity>? testHistory,
    List<TestViewEntity>? testView,
    FormSubmissionStatus? formStatus,
  }) {
    return TestHistoryState(
      testHistory: testHistory ?? this.testHistory,
      testView: testView ?? this.testView,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
