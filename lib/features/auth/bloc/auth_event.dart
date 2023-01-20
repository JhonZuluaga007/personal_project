part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class LoginUserE extends AuthEvent {
  final String userName;
  final String password;
  LoginUserE(this.userName, this.password);
}
