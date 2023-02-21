// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pcr_bloc.dart';

@immutable
class PcrState {
  final bool? success;
  final int? statusCode;
  final FormSubmissionStatus? formStatus;

  const PcrState({
    this.success,
    this.formStatus,
    this.statusCode,
  });

  PcrState copyWith({
    bool? success,
    int? statusCode,
    FormSubmissionStatus? formStatus,
  }) {
    return PcrState(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
