// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'medical_history_bloc.dart';

@immutable
abstract class MedicalHistoryEvent {}

class GetMedicalHistoryEvent extends MedicalHistoryEvent {
  final String userId;
  GetMedicalHistoryEvent(this.userId, {required List<String> questions2});
}
