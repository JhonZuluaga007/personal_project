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
  final String question1;

  AntigenQuestion1Event({
    required this.question1,
  });
}
class AntigenQuestion2Event extends AntigenTestEvent {
  final List<String> question2;

  AntigenQuestion2Event({
    required this.question2,
  });
}

class AntigenQuestion3DateEvent extends AntigenTestEvent {
  final DateTime question3;

  AntigenQuestion3DateEvent({
    required this.question3,
  });
}

