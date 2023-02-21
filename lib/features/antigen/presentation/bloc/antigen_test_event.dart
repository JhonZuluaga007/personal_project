// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'antigen_test_bloc.dart';

@immutable
abstract class AntigenTestEvent {}

class AntigenValidateEvent extends AntigenTestEvent {
  final String userId;
  final String code;

  AntigenValidateEvent({
    required this.userId,
    required this.code,
  });
}

class AntigenQuestion1Event extends AntigenTestEvent {
  AntigenQuestion1Event(this.question1);
  final String? question1;
}

class AntigenQuestion2Event extends AntigenTestEvent {
  final QuestionTypeTwoEntity question2;

  AntigenQuestion2Event({required this.question2});
}

class AntigenQuestion3Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question3;

  AntigenQuestion3Event({required this.question3});
}

class AntigenQuestion4Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question4;

  AntigenQuestion4Event({required this.question4});
}

class AntigenQuestion5Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question5;

  AntigenQuestion5Event({required this.question5});
}

class AntigenQuestion6Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question6;

  AntigenQuestion6Event({required this.question6});
}

class AntigenQuestion7Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question7;

  AntigenQuestion7Event({required this.question7});
}

class AntigenQuestion8Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question8;

  AntigenQuestion8Event({required this.question8});
}

class AntigenQuestion9Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question9;

  AntigenQuestion9Event({required this.question9});
}

class AntigenQuestion10Event extends AntigenTestEvent {
  final QuestionTypeTwoEntity question10;

  AntigenQuestion10Event({required this.question10});
}

class AntigenQuestion11Event extends AntigenTestEvent {
  final QuestionTypeTwoEntity question11;

  AntigenQuestion11Event({required this.question11});
}

class AntigenQuestion12Event extends AntigenTestEvent {
  final QuestionTypeTwoEntity question12;

  AntigenQuestion12Event({required this.question12});
}

class AntigenQuestion13Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question13;

  AntigenQuestion13Event({required this.question13});
}

class AntigenQuestion14Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question14;

  AntigenQuestion14Event({required this.question14});
}

class AntigenQuestion15Event extends AntigenTestEvent {
  final QuestionTypeOneEntity question15;

  AntigenQuestion15Event({required this.question15});
}
