part of 'medical_history_bloc.dart';

@immutable
class MedicalHistoryState {
  final FormSubmissionStatus? formStatus;
  final String? id;
  final bool? question1;
  List<OpDropdown>? question2;
  final String? errorMessage;
  final FormSubmissionStatus? infoUploaded;

  MedicalHistoryState(
      {this.formStatus = const InitialFormStatus(),
      this.errorMessage,
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
    String? errorMessage,
  }) {
    return MedicalHistoryState(
      formStatus: formStatus ?? this.formStatus,
      id: id ?? this.id,
      question1: question1 ?? this.question1,
      question2: question2 ?? this.question2,
      infoUploaded: infoUploaded ?? this.infoUploaded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  MedicalHistoryState initialState() => MedicalHistoryState(
        infoUploaded: InitialFormStatus(),
      );
}
