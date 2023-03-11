// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pcr_bloc.dart';

@immutable
abstract class PcrEvent {}

class PcrValidateEvent extends PcrEvent {
  final String code;
  final String project;
  
  PcrValidateEvent({
    required this.code,
    required this.project,
  });
}
