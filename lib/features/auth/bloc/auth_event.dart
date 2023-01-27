// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginUserE extends AuthEvent {
  final String userName;
  final String password;
  LoginUserE(this.userName, this.password);
}

class UserUpdateEvent extends AuthEvent {
  final UserUpdateEntity userUpdateEntity;
  UserUpdateEvent(this.userUpdateEntity);
}
