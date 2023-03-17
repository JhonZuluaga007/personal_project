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
  final List<String> question2;

  AntigenQuestion2Event({required this.question2});
}

class AntigenQuestion3Event extends AntigenTestEvent {
  final String question3;

  AntigenQuestion3Event({required this.question3});
}

class AntigenQuestion4Event extends AntigenTestEvent {
  final String question4;

  AntigenQuestion4Event({required this.question4});
}

class AntigenQuestion5Event extends AntigenTestEvent {
  final String question5;

  AntigenQuestion5Event({required this.question5});
}

class AntigenQuestion6Event extends AntigenTestEvent {
  final String question6;

  AntigenQuestion6Event({required this.question6});
}

class AntigenQuestion7Event extends AntigenTestEvent {
  final String question7;

  AntigenQuestion7Event({required this.question7});
}

class AntigenQuestion8Event extends AntigenTestEvent {
  final String question8;

  AntigenQuestion8Event({required this.question8});
}

class AntigenQuestion9Event extends AntigenTestEvent {
  final String question9;

  AntigenQuestion9Event({required this.question9});
}

class AntigenQuestion10Event extends AntigenTestEvent {
  final List<String> question10;

  AntigenQuestion10Event({required this.question10});
}

class AntigenQuestion11Event extends AntigenTestEvent {
  final List<String> question11;

  AntigenQuestion11Event({required this.question11});
}

class AntigenQuestion12Event extends AntigenTestEvent {
  final List<String> question12;

  AntigenQuestion12Event({required this.question12});
}

class AntigenQuestion13Event extends AntigenTestEvent {
  final String question13;

  AntigenQuestion13Event({required this.question13});
}

class AntigenQuestion14Event extends AntigenTestEvent {
  final String question14;

  AntigenQuestion14Event({required this.question14});
}

class AntigenQuestion15Event extends AntigenTestEvent {
  final String question15;

  AntigenQuestion15Event({required this.question15});
}

class AntigenRegisterEvent extends AntigenTestEvent {}

class AntigenImageEvent extends AntigenTestEvent {
  final String testImage;

  AntigenImageEvent({required this.testImage});
}
