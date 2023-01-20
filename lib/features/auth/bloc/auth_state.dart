// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
class AuthState {
    final String? project;
    final int? statusCode;
    final String? token;
    final String userId;
    final String errorMessage;
    final FormSubmissionStatus formStatus;


  const AuthState({
    this.project = "",
    this.statusCode = 404,
    this.token = "",
    this.userId = "",
    this.formStatus = const InitialFormStatus(),
    this.errorMessage = "", 
  });


  AuthState copyWith({
    String? project,
    int? statusCode,
    String? token,
    String? userId,
    String? errorMessage,
    FormSubmissionStatus? formStatus,
  }) {
    return AuthState(
      project: project ?? this.project,
      statusCode: statusCode ?? this.statusCode,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
