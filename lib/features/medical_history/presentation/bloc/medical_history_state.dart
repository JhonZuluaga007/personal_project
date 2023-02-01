part of 'medical_history_bloc.dart';

@immutable
class MedicalHistoryState {
  final FormSubmissionStatus? formStatus;
  final String? id;
  final AtedEntity? created;
  final Question1Entity? question1;
  final Question2Entity? question2;
  final bool? status;
  final AtedEntity? updated;
  final UserIdEntity? userId;

  const MedicalHistoryState(
      {this.formStatus = const InitialFormStatus(),
      this.id,
      this.created,
      this.question1,
      this.question2,
      this.status,
      this.updated,
      this.userId});

  MedicalHistoryState copyWith({
    FormSubmissionStatus? formStatus,
    String? id,
    AtedEntity? created,
    Question1Entity? question1,
    Question2Entity? question2,
    bool? status,
    AtedEntity? updated,
    UserIdEntity? userId,
  }) {
    return MedicalHistoryState(
        formStatus: formStatus ?? this.formStatus,
        id: id ?? this.id,
        created: created ?? this.created,
        question1: question1 ?? this.question1,
        question2: question2 ?? this.question2,
        updated: updated ?? this.updated,
        status: status ?? this.status,
        userId: userId);
  }
}
