part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginUserE extends AuthEvent {
  final String userName;
  final String password;
  LoginUserE(this.userName, this.password);
}

class InitialStateForm extends AuthEvent {
  InitialStateForm();
}

class GetUser extends AuthEvent {
  GetUser();
}

class UserUpdateEvent extends AuthEvent {
  final UserUpdateEntity userUpdateEntity;
  UserUpdateEvent(this.userUpdateEntity);
}

class ResetPassword extends AuthEvent {
  final String email;
  ResetPassword(this.email);
}

class LogOut extends AuthEvent {
  LogOut();
}

class ChangePassword extends AuthEvent {
  final String userId;
  final String oldPassword;
  final String newPassword;

  ChangePassword(this.userId, this.oldPassword, this.newPassword);
}

class UpdateImage extends AuthEvent {
  final String profileImage;

  UpdateImage({required this.profileImage});
}

class SuccessChangePassword extends AuthEvent {
  SuccessChangePassword();
}
