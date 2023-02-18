part of 'medical_history_bloc.dart';

@immutable
abstract class MedicalHistoryEvent {}

class GetMedicalHistoryEvent extends MedicalHistoryEvent {
  final String userId;
  GetMedicalHistoryEvent(this.userId, {required List<String> questions2});
}

class EditMedicalHistoryEvent extends MedicalHistoryEvent {
  final String userId;
  final String responseOne;
  final List<String> responseTwo;
  EditMedicalHistoryEvent({
    required this.userId,
    required this.responseOne,
    required this.responseTwo,
  });
}

class ResetStatesMedicalHistoryEvent extends MedicalHistoryEvent {}
