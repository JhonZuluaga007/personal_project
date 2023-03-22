part of 'auth_bloc.dart';

@immutable
class AuthState {
  final String? project;
  final int? statusCode;
  final String? token;
  final String? userId;
  final bool? acceptsTerms;
  final String? address;
  final String? city;
  final String? zip;
  final OpStatesEntity? state;
  final String? cellphone;
  final DateOfBirthEntity? dateOfBirth;
  final String? email;
  final OpEthnicityEntity? ethnicity;
  final bool? firstLogin;
  final OpGenderEntity? gender;
  final bool? informationUpdated;
  final bool? isActive;
  final bool? isConfirmed;
  final String? lastname;
  final String? loginId;
  final String? middleName;
  final String? name;
  final String? participantId;
  final String? password;
  final bool? passwordReset;
  final String? profileImage;
  final IdTestEntity? projects;
  final OpRaceEntity? race;
  final String? roles;
  final SchoolLevelsEntity? schoolLevels;
  final OpSexEntity? sex;
  final String? errorMessage;
  final String? message;
  final FormSubmissionStatus formStatus;
  final FormSubmissionStatus? formChangePasswordStatus;
  final FormSubmissionStatus? formResetPassword;

  const AuthState({
    this.project = '',
    this.statusCode = 0,
    this.token = '',
    this.userId = '',
    this.acceptsTerms = false,
    this.address = "",
    this.city = "",
    this.zip = "",
    this.state,
    this.cellphone = '',
    this.dateOfBirth,
    this.email = '',
    this.ethnicity,
    this.firstLogin = false,
    this.gender,
    this.informationUpdated = false,
    this.isActive = false,
    this.isConfirmed = false,
    this.lastname = '',
    this.loginId = '',
    this.middleName = '',
    this.name = '',
    this.participantId = '',
    this.password = '',
    this.passwordReset = false,
    this.profileImage = '',
    this.projects,
    this.race,
    this.roles = '',
    this.schoolLevels,
    this.sex,
    this.errorMessage = '',
    this.message = '',
    this.formChangePasswordStatus = const InitialFormStatus(),
    this.formStatus = const InitialFormStatus(),
    this.formResetPassword = const InitialFormStatus(),
  });

  AuthState initialState({
    String? project,
    int? statusCode,
    String? token,
    String? userId,
    bool? acceptsTerms,
    String? address,
    String? city,
    String? zip,
    OpStatesEntity? state,
    String? cellphone,
    DateOfBirthEntity? dateOfBirth,
    String? email,
    OpEthnicityEntity? ethnicity,
    bool? firstLogin,
    OpGenderEntity? gender,
    bool? informationUpdated,
    bool? isActive,
    bool? isConfirmed,
    String? lastname,
    String? loginId,
    String? middleName,
    String? name,
    String? participantId,
    String? password,
    bool? passwordReset,
    String? profileImage,
    IdTestEntity? projects,
    OpRaceEntity? race,
    String? roles,
    SchoolLevelsEntity? schoolLevels,
    OpSexEntity? sex,
    String? errorMessage,
    String? message,
    FormSubmissionStatus? formStatus,
    FormSubmissionStatus? formChangePasswordStatus,
    FormSubmissionStatus? formResetPassword,
  }) =>
      AuthState(
        project: '',
        statusCode: 0,
        token: '',
        userId: '',
        acceptsTerms: false,
        address: "",
        city: "",
        zip: "",
        cellphone: '',
        dateOfBirth: DateOfBirthEntity(date: DateTime.now()),
        email: '',
        ethnicity: OpEthnicityEntity(id: "", ethnicity: ""),
        firstLogin: false,
        gender: OpGenderEntity(id: "", gender: ""),
        informationUpdated: false,
        isActive: false,
        isConfirmed: false,
        lastname: '',
        loginId: '',
        middleName: '',
        name: '',
        participantId: '',
        password: '',
        passwordReset: false,
        profileImage: '',
        projects: null,
        race: OpRaceEntity(id: "", race: ""),
        roles: '',
        schoolLevels: SchoolLevelsEntity(
            id: IdTestEntity(oid: ""),
            level: "",
            order: 1,
            project: IdTestEntity(oid: "")),
        sex: OpSexEntity(id: "", sex: ""),
        errorMessage: '',
        message: '',
        formChangePasswordStatus: const InitialFormStatus(),
        formStatus: const InitialFormStatus(),
        formResetPassword: const InitialFormStatus(),
      );

  AuthState successPasswordChanged({
    final FormSubmissionStatus? formChangePasswordStatus,
  }) {
    return AuthState(formChangePasswordStatus: const InitialFormStatus());
  }

  AuthState copyWith({
    String? project,
    int? statusCode,
    String? token,
    String? userId,
    bool? acceptsTerms,
    String? address,
    String? city,
    OpStatesEntity? state,
    String? zip,
    String? cellphone,
    DateOfBirthEntity? dateOfBirth,
    String? email,
    OpEthnicityEntity? ethnicity,
    bool? firstLogin,
    OpGenderEntity? gender,
    bool? informationUpdated,
    bool? isActive,
    bool? isConfirmed,
    String? lastname,
    String? loginId,
    String? middleName,
    String? name,
    String? participantId,
    String? password,
    bool? passwordReset,
    String? profileImage,
    IdTestEntity? projects,
    OpRaceEntity? race,
    String? roles,
    SchoolLevelsEntity? schoolLevels,
    OpSexEntity? sex,
    String? errorMessage,
    String? message,
    FormSubmissionStatus? formStatus,
    FormSubmissionStatus? formChangePasswordStatus,
    FormSubmissionStatus? formResetPassword,
  }) {
    return AuthState(
      project: project ?? this.project,
      statusCode: statusCode ?? this.statusCode,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      acceptsTerms: acceptsTerms ?? this.acceptsTerms,
      address: address ?? this.address,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      state: state ?? this.state,
      cellphone: cellphone ?? this.cellphone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      ethnicity: ethnicity ?? this.ethnicity,
      firstLogin: firstLogin ?? this.firstLogin,
      gender: gender ?? this.gender,
      informationUpdated: informationUpdated ?? this.informationUpdated,
      isActive: isActive ?? this.isActive,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      lastname: lastname ?? this.lastname,
      loginId: loginId ?? this.loginId,
      middleName: middleName ?? this.middleName,
      name: name ?? this.name,
      participantId: participantId ?? this.participantId,
      password: password ?? this.password,
      passwordReset: passwordReset ?? this.passwordReset,
      profileImage: profileImage ?? this.profileImage,
      projects: projects ?? this.projects,
      race: race ?? this.race,
      roles: roles ?? this.roles,
      schoolLevels: schoolLevels ?? this.schoolLevels,
      sex: sex ?? this.sex,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
      formChangePasswordStatus:
          formChangePasswordStatus ?? this.formChangePasswordStatus,
      formResetPassword: formResetPassword ?? this.formResetPassword,
    );
  }
}
