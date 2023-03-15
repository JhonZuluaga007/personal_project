part of 'pcr_bloc.dart';

@immutable
class PcrState {
  final PcrTestModel? testPcr;
  final int? statusCode;
  final FormSubmissionStatus? formStatus;
  final String? errorMessage;

  PcrState({
    this.testPcr,
    this.formStatus,
    this.statusCode,
    this.errorMessage,
  });

  PcrState copyWith({
    PcrTestModel? testPcr,
    int? statusCode,
    FormSubmissionStatus? formStatus,
    String? errorMessage,
  }) {
    return PcrState(
      testPcr: testPcr ?? this.testPcr,
      statusCode: statusCode ?? this.statusCode,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
