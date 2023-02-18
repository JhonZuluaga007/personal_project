// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'antigen_test_bloc.dart';

@immutable
class AntigenTestState {
  final String? code;
  final String? id;
  final String? idTest;
  final int? statusCode;
  final FormSubmissionStatus? formStatus;
  final String? question1;
  final List<String>? question2;
  final DateTime? question3;

  const AntigenTestState({
    this.code,
    this.id,
    this.idTest,
    this.statusCode = 200,
    this.formStatus = const InitialFormStatus(),
    this.question1,
    this.question2,
    this.question3,
  });

  AntigenTestState copyWith({
    String? code,
    String? id,
    String? idTest,
    int? statusCode,
    FormSubmissionStatus? formStatus,
    String? question1,
    List<String>? question2,
    DateTime? question3,
  }) {
    return AntigenTestState(
      code: code ?? this.code,
      id: id ?? this.id,
      idTest: idTest ?? this.idTest,
      statusCode: statusCode ?? this.statusCode,
      formStatus: formStatus ?? this.formStatus,
      question1: question1 ?? this.question1,
      question2: question2 ?? this.question2,
      question3: question3 ?? this.question3,
    );
  }
}
