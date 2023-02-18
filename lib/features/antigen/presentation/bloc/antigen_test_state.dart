// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'antigen_test_bloc.dart';

@immutable
class AntigenTestState {
  final String code;
  final String id;
  final String idTest;
  final DateTime? created;
  final int statusCode;
  final FormSubmissionStatus formStatus;
  final String question1Value;
  final List<String> question2Value;
  final String? question3;
  final List<String> question10Value;
  final List<String> question11Value;
  final List<String> question12Value;
  final String question13Value;
  final String question14Value;
  final String question15Value;
  final String question4Value;
  final String question5Value;
  final String question6Value;
  final String question7Value;
  final String question8Value;
  final String question9Value;
  final DateTime? updatedValue;
  final int testTime;

  const AntigenTestState({
    this.created, 
    this.code = "",
    this.id = "",
    this.idTest = "",
    this.statusCode = 200,
    this.formStatus = const InitialFormStatus(),
    this.question1Value = "",
    this.question2Value = const [],
    this.question3,
    this.testTime = 0,
    this.question10Value = const [],
    this.question11Value = const [],
    this.question12Value = const [],
    this.question13Value = "",
    this.question14Value = "",
    this.question15Value = "",
    this.question4Value = "",
    this.question5Value = "",
    this.question6Value ="",
    this.question7Value = "",
    this.question8Value = "",
    this.question9Value = "", 
    this.updatedValue, 
  });

  AntigenTestState copyWith({
    String? code,
    String? id,
    String? idTest,
    DateTime? created,
    int? statusCode,
    FormSubmissionStatus? formStatus,
    String? question1Value,
    List<String>? question2Value,
    String? question3,
    List<String>? question10Value,
    List<String>? question11Value,
    List<String>? question12Value,
    String? question13Value,
    String? question14Value,
    String? question15Value,
    String? question4Value,
    String? question5Value,
    String? question6Value,
    String? question7Value,
    String? question8Value,
    String? question9Value,
    DateTime? updatedValue,
    int? testTime,
  }) {
    return AntigenTestState(
      code: code ?? this.code,
      id: id ?? this.id,
      idTest: idTest ?? this.idTest,
      created: created ?? this.created,
      statusCode: statusCode ?? this.statusCode,
      formStatus: formStatus ?? this.formStatus,
      question1Value: question1Value ?? this.question1Value,
      question2Value: question2Value ?? this.question2Value,
      question3: question3 ?? this.question3,
      question10Value: question10Value ?? this.question10Value,
      question11Value: question11Value ?? this.question11Value,
      question12Value: question12Value ?? this.question12Value,
      question13Value: question13Value ?? this.question13Value,
      question14Value: question14Value ?? this.question14Value,
      question15Value: question15Value ?? this.question15Value,
      question4Value: question4Value ?? this.question4Value,
      question5Value: question5Value ?? this.question5Value,
      question6Value: question6Value ?? this.question6Value,
      question7Value: question7Value ?? this.question7Value,
      question8Value: question8Value ?? this.question8Value,
      question9Value: question9Value ?? this.question9Value,
      updatedValue: updatedValue ?? this.updatedValue,
      testTime: testTime ?? this.testTime,
    );
  }
}
