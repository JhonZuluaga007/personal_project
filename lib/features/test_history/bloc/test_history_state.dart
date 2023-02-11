part of 'test_history_bloc.dart';

@immutable
class TestHistoryState {
  final List<TestHistoryEntity> allTestHistoryList;
  final List<TestHistoryEntity> antigenTestHistoryList;
  final List<TestHistoryEntity> pcrTestHistoryList;
  final FormSubmissionStatus? formStatus;

  const TestHistoryState({
    this.allTestHistoryList = const [],
    this.antigenTestHistoryList = const [],
    this.pcrTestHistoryList = const [],
    this.formStatus = const InitialFormStatus(),
  });

  TestHistoryState copyWith({
    List<TestHistoryEntity>? allTestHistoryList,
    List<TestHistoryEntity>? antigenTestHistoryList,
    List<TestHistoryEntity>? pcrTestHistoryList,
    FormSubmissionStatus? formStatus,
  }) {
    return TestHistoryState(
      allTestHistoryList: allTestHistoryList ?? this.allTestHistoryList,
      antigenTestHistoryList:
          antigenTestHistoryList ?? this.antigenTestHistoryList,
      pcrTestHistoryList: pcrTestHistoryList ?? this.pcrTestHistoryList,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
