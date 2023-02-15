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
  final String? message;
  final FormSubmissionStatus? infoUploaded;

  const MedicalHistoryState({
    this.formStatus = const InitialFormStatus(),
    this.message,
    this.id,
    this.created,
    this.question1,
    this.question2,
    this.status,
    this.updated,
    this.infoUploaded = const InitialFormStatus(),
    this.userId,
  });

  MedicalHistoryState copyWith({
    FormSubmissionStatus? formStatus,
    String? id,
    AtedEntity? created,
    Question1Entity? question1,
    Question2Entity? question2,
    bool? status,
    AtedEntity? updated,
    UserIdEntity? userId,
    FormSubmissionStatus? infoUploaded,
    String? message,
  }) {
    return MedicalHistoryState(
      formStatus: formStatus ?? this.formStatus,
      id: id ?? this.id,
      created: created ?? this.created,
      question1: question1 ?? this.question1,
      question2: question2 ?? this.question2,
      updated: updated ?? this.updated,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      infoUploaded: infoUploaded ?? this.infoUploaded,
      message: message ?? this.message,
    );
  }

  MedicalHistoryState initialState() => MedicalHistoryState(
        formStatus: const InitialFormStatus(),
        id: "",
        created: AtedEntity(date: DateTime.now()),
        question1: Question1Entity(name: "", value: ""),
        question2: Question2Entity(name: "", value: const []),
        status: false,
        updated: AtedEntity(date: DateTime.now()),
        infoUploaded: const InitialFormStatus(),
        message: "",
      );
}
