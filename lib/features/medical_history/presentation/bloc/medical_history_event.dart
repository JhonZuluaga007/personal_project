part of 'medical_history_bloc.dart';

@immutable
abstract class MedicalHistoryEvent {}

class GetMedicalHistoryEvent extends MedicalHistoryEvent {
  final String userId;
  GetMedicalHistoryEvent(this.userId);
}
