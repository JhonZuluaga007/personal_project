// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'test_history_bloc.dart';

@immutable
class TestHistoryState {
  final List<TestHistoryEntity> allTestHistoryList;
  // final TestViewEntity testView;

  final FormSubmissionStatus? formStatus;

  const TestHistoryState({
    this.allTestHistoryList = const [],
    this.formStatus = const InitialFormStatus(),
    // this.testView = TestViewEntity()
  });


  TestHistoryState copyWith({
    List<TestHistoryEntity>? allTestHistoryList,

    FormSubmissionStatus? formStatus,
  }) {
    return TestHistoryState(
      allTestHistoryList: allTestHistoryList ?? this.allTestHistoryList,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
