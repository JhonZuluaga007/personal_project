class UserEntity {
  UserEntity({
    required this.authenticated,
    required this.userId,
    required this.token,
    required this.sessionToken,
    required this.accountId,
    required this.omsId,
    required this.locked,
    required this.errormsg,
  });

  final bool authenticated;
  final int userId;
  final String token;
  final String sessionToken;
  final String accountId;
  final String omsId;
  final bool locked;
  final String errormsg;
}
