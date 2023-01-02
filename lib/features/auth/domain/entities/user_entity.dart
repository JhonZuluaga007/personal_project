class UserEntity {
  UserEntity({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final Data data;
  final String message;
  final int statusCode;
}

class Data {
  Data({
    required this.id,
    required this.acceptsTerms,
    required this.dateOfBirth,
    required this.email,
    required this.firstLogin,
    required this.informationUpdated,
    required this.isActive,
    required this.isConfirmed,
    required this.lastname,
    required this.loginId,
    required this.name,
    required this.organization,
    required this.password,
    required this.passwordReset,
    required this.projects,
  });

  final String id;
  final bool acceptsTerms;
  final String dateOfBirth;
  final String email;
  final bool firstLogin;
  final bool informationUpdated;
  final bool isActive;
  final bool isConfirmed;
  final String lastname;
  final String loginId;
  final String name;
  final String organization;
  final String password;
  final bool passwordReset;
  final List<dynamic> projects;
  
  
  
  
}
