// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'antigen_test_bloc.dart';

@immutable
class AntigenTestState {
  final String code;
  final String id;
  final String idTest;
  final String errorMessage;
  final DateTime? created;
  final int statusCode;
  final FormSubmissionStatus formStatus;
  final QuestionTypeOneEntity? question1;
  final QuestionTypeTwoEntity? question2;
  final QuestionTypeOneEntity? question3;
  final QuestionTypeOneEntity? question4;
  final QuestionTypeOneEntity? question5;
  final QuestionTypeOneEntity? question6;
  final QuestionTypeOneEntity? question7;
  final QuestionTypeOneEntity? question8;
  final QuestionTypeOneEntity? question9;
  final QuestionTypeTwoEntity? question10;
  final QuestionTypeTwoEntity? question11;
  final QuestionTypeTwoEntity? question12;
  final QuestionTypeOneEntity? question13;
  final QuestionTypeOneEntity? question14;
  final QuestionTypeOneEntity? question15;
  final DateTime? updatedValue;
  final int testTime;

  const AntigenTestState({
    this.created,
    this.code = "",
    this.id = "",
    this.idTest = "",
    this.errorMessage = "",
    this.statusCode = 200,
    this.formStatus = const InitialFormStatus(),
    this.testTime = 0,
    this.question1,
    this.question2,
    this.question3,
    this.question4,
    this.question5,
    this.question6,
    this.question7,
    this.question8,
    this.question9,
    this.question10,
    this.question11,
    this.question12,
    this.question13,
    this.question14,
    this.question15,
    this.updatedValue,
  });

  AntigenTestState copyWith({
    String? code,
    String? id,
    String? idTest,
    String? errorMessage,
    DateTime? created,
    int? statusCode,
    FormSubmissionStatus? formStatus,
    QuestionTypeOneEntity? question1,
    QuestionTypeTwoEntity? question2,
    QuestionTypeOneEntity? question3,
    QuestionTypeOneEntity? question4,
    QuestionTypeOneEntity? question5,
    QuestionTypeOneEntity? question6,
    QuestionTypeOneEntity? question7,
    QuestionTypeOneEntity? question8,
    QuestionTypeOneEntity? question9,
    QuestionTypeTwoEntity? question10,
    QuestionTypeTwoEntity? question11,
    QuestionTypeTwoEntity? question12,
    QuestionTypeOneEntity? question13,
    QuestionTypeOneEntity? question14,
    QuestionTypeOneEntity? question15,
    DateTime? updatedValue,
    int? testTime,
  }) =>
      AntigenTestState(
        code: code ?? this.code,
        id: id ?? this.id,
        idTest: idTest ?? this.idTest,
        errorMessage: errorMessage ?? this.errorMessage,
        created: created ?? this.created,
        statusCode: statusCode ?? this.statusCode,
        formStatus: formStatus ?? this.formStatus,
        question1: question1 ?? this.question1,
        question2: question2 ?? this.question2,
        question3: question3 ?? this.question3,
        question4: question4 ?? this.question4,
        question5: question5 ?? this.question5,
        question6: question6 ?? this.question6,
        question7: question7 ?? this.question7,
        question8: question8 ?? this.question8,
        question9: question9 ?? this.question9,
        question10: question10 ?? this.question10,
        question11: question11 ?? this.question11,
        question12: question12 ?? this.question12,
        question13: question13 ?? this.question13,
        question14: question14 ?? this.question14,
        question15: question15 ?? this.question15,
        updatedValue: updatedValue ?? this.updatedValue,
        testTime: testTime ?? this.testTime,
      );
}
