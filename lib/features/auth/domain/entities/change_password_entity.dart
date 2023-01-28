class ChangePasswordEntity {
  ChangePasswordEntity({
    required this.userId,
    required this.pass,
    required this.newpass,
  });

  final String userId;
  final String pass;
  final String newpass;
}
