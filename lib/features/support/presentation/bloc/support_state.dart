part of 'support_bloc.dart';

class SupportState {
  final FormSubmissionStatus? formStatus;
  const SupportState({this.formStatus = const InitialFormStatus()});

  SupportState initialState() => const SupportState(
        formStatus: InitialFormStatus(),
      );
  SupportState copyWith({
    FormSubmissionStatus? formStatus,
  }) {
    return SupportState(formStatus: formStatus ?? this.formStatus);
  }
}
