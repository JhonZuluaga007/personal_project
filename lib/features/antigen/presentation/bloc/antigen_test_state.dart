// ignore_for_file: must_be_immutable

part of 'antigen_test_bloc.dart';

@immutable
class AntigenTestState {
  final String code;
  final String? id;
  final String? idTest;
  final String errorMessage;
  final String message;
  final DateTime? created;
  final int statusCode;
  final FormSubmissionStatus formStatus;
  List<OpSymptomEntity>? symptoms;
  List<OpVaccineEntity>? vaccines;
  final QuestionType1StringEntity? question1;
  final QuestionType10ListEntity? question2;
  final QuestionType1StringEntity? question3;
  final QuestionType1StringEntity? question4;
  final QuestionType1StringEntity? question5;
  final QuestionType1StringEntity? question6;
  final QuestionType1StringEntity? question7;
  final QuestionType1StringEntity? question8;
  final QuestionType1StringEntity? question9;
  final QuestionType10ListEntity? question10;
  final QuestionType10ListEntity? question11;
  final QuestionType1StringEntity? question12;
  final QuestionType1StringEntity? question13;
  final QuestionType1StringEntity? question14;
  final QuestionType1StringEntity? question15;
  final DateTime? updatedValue;
  final int? testTime;
  final List<String>? stepHistory;
  final String testImage;
  final AntigenRegisterResponseEntity? antigenResponse;

  AntigenTestState({
    this.message = "",
    this.created,
    this.code = "",
    this.id = "",
    this.idTest = "",
    this.errorMessage = "",
    this.statusCode = 200,
    this.formStatus = const InitialFormStatus(),
    this.symptoms,
    this.vaccines,
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
    this.stepHistory,
    this.testImage = "",
    this.antigenResponse,
  });

  AntigenTestState copyWith({
    String? code,
    String? id,
    String? idTest,
    String? errorMessage,
    String? message,
    DateTime? created,
    int? statusCode,
    FormSubmissionStatus? formStatus,
    List<OpSymptomEntity>? symptoms,
    List<OpVaccineEntity>? vaccines,
    QuestionType1StringEntity? question1,
    QuestionType10ListEntity? question2,
    QuestionType1StringEntity? question3,
    QuestionType1StringEntity? question4,
    QuestionType1StringEntity? question5,
    QuestionType1StringEntity? question6,
    QuestionType1StringEntity? question7,
    QuestionType1StringEntity? question8,
    QuestionType1StringEntity? question9,
    QuestionType10ListEntity? question10,
    QuestionType10ListEntity? question11,
    QuestionType1StringEntity? question12,
    QuestionType1StringEntity? question13,
    QuestionType1StringEntity? question14,
    QuestionType1StringEntity? question15,
    DateTime? updatedValue,
    int? testTime,
    List<String>? stepHistory,
    String? testImage,
    AntigenRegisterResponseEntity? antigenResponse,
  }) {
    return AntigenTestState(
      code: code ?? this.code,
      id: id ?? this.id,
      idTest: idTest ?? this.idTest,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      created: created ?? this.created,
      statusCode: statusCode ?? this.statusCode,
      formStatus: formStatus ?? this.formStatus,
      symptoms: symptoms ?? this.symptoms,
      vaccines: vaccines ?? this.vaccines,
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
      stepHistory: stepHistory ?? this.stepHistory,
      testImage: testImage ?? this.testImage,
      antigenResponse: antigenResponse ?? this.antigenResponse,
    );
  }
}
