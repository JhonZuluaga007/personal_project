part of 'medical_history_bloc.dart';

@immutable
abstract class MedicalHistoryEvent {}

class GetMedicalHistoryEvent extends MedicalHistoryEvent {
  final String userId;
  GetMedicalHistoryEvent(this.userId, {required List<String> questions2});
}

class EditMedicalHistoryEvent extends MedicalHistoryEvent {
  final bool responseOne;
  final List<String> responseTwo;
  EditMedicalHistoryEvent({
    required this.responseOne,
    required this.responseTwo,
  });
}

class ResetStatesMedicalHistoryEvent extends MedicalHistoryEvent {}
