part of 'medical_history_bloc.dart';

@immutable
class MedicalHistoryState {
  final FormSubmissionStatus? formStatus;
  final String? id;
  final MedicalHistoryEntity? medicalHistoryEntity;

  final String? message;
  final FormSubmissionStatus? infoUploaded;

  const MedicalHistoryState(
      {this.formStatus = const InitialFormStatus(),
      this.message,
      this.id,
      this.infoUploaded = const InitialFormStatus(),
      this.medicalHistoryEntity});

  MedicalHistoryState copyWith({
    FormSubmissionStatus? formStatus,
    String? id,
    MedicalHistoryEntity? medicalHistoryEntity,
    bool? status,
    FormSubmissionStatus? infoUploaded,
    String? message,
  }) {
    return MedicalHistoryState(
      formStatus: formStatus ?? this.formStatus,
      id: id ?? this.id,
      medicalHistoryEntity: medicalHistoryEntity ?? this.medicalHistoryEntity,
      infoUploaded: infoUploaded ?? this.infoUploaded,
      message: message ?? this.message,
    );
  }

  MedicalHistoryState initialState() => const MedicalHistoryState(
        infoUploaded: InitialFormStatus(),
      );
}
