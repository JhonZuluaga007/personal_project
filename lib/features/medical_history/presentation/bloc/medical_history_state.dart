part of 'medical_history_bloc.dart';

@immutable
class MedicalHistoryState {
  final FormSubmissionStatus? formStatus;
  final String? id;
  final bool? question1;
  final List<OpRiskFactorEntity>? question2;
  final String? message;
  final FormSubmissionStatus? infoUploaded;

  const MedicalHistoryState(
      {this.formStatus = const InitialFormStatus(),
      this.message,
      this.id,
      this.infoUploaded = const InitialFormStatus(),
      this.question1,
      this.question2
    });

  MedicalHistoryState copyWith({
    FormSubmissionStatus? formStatus,
    String? id,
    bool? question1,
    List<OpRiskFactorEntity>? question2,
    FormSubmissionStatus? infoUploaded,
    String? message,
  }) {
    return MedicalHistoryState(
      formStatus: formStatus ?? this.formStatus,
      id: id ?? this.id,
      question1: question1 ?? this.question1,
      question2: question2 ?? this.question2,
      infoUploaded: infoUploaded ?? this.infoUploaded,
      message: message ?? this.message,
    );
  }

  MedicalHistoryState initialState() => const MedicalHistoryState(
        infoUploaded: InitialFormStatus(),
      );
}
