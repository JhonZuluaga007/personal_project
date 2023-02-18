// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
class AuthState {
  final String? project;
  final int? statusCode;
  final String? token;
  final String userId;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final String? cellphone;
  final String? email;
  final String? ethnicity;
  final String? gender;
  final String? image;
  final DateOfBirth? birthDate;
  final bool? informationUpdated;
  final bool? isActive;
  final bool? isConfirmed;
  final String? lastname;
  final String? loginId;
  final String? middleName;
  final String? name;
  final String organization;
  final String? participantId;
  final String? race;
  final String? sex;
  final String errorMessage;
  final String? message;
  final String? levelSchool;
  final FormSubmissionStatus formStatus;
  final FormSubmissionStatus? formChangePasswordStatus;
  final FormSubmissionStatus? formResetPassword;

  const AuthState({
    this.project = "",
    this.statusCode = 404,
    this.token = "",
    this.userId = "",
    this.address = "",
    this.birthDate,
    this.city = "",
    this.state = "",
    this.zip = "",
    this.cellphone = "",
    this.email = "",
    this.ethnicity = "",
    this.gender = "",
    this.image = "",
    this.informationUpdated = false,
    this.isActive = false,
    this.isConfirmed = false,
    this.lastname = "",
    this.loginId = "",
    this.middleName = "",
    this.name = "",
    this.organization = "",
    this.participantId = "",
    this.race = "",
    this.sex = "",
    this.levelSchool = "",
    this.errorMessage = "",
    this.message = "",
    this.formChangePasswordStatus = const InitialFormStatus(),
    this.formStatus = const InitialFormStatus(),
    this.formResetPassword = const InitialFormStatus()
  });

  AuthState copyWith({
    String? project,
    DateOfBirth? birthDate,
    int? statusCode,
    String? token,
    String? userId,
    String? address,
    String? city,
    String? state,
    String? zip,
    String? cellphone,
    String? email,
    String? ethnicity,
    String? gender,
    String? image,
    bool? informationUpdated,
    bool? isActive,
    bool? isConfirmed,
    String? lastname,
    String? loginId,
    String? middleName,
    String? name,
    String? organization,
    String? participantId,
    String? race,
    String? sex,
    String? errorMessage,
    String? message,
    String? levelSchool,
    FormSubmissionStatus? formStatus,
    FormSubmissionStatus? formResetPassword,
    FormSubmissionStatus? formChangePasswordStatus,
  }) {
    return AuthState(
      birthDate: birthDate ?? this.birthDate,
      project: project ?? this.project,
      statusCode: statusCode ?? this.statusCode,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      cellphone: cellphone ?? this.cellphone,
      email: email ?? this.email,
      ethnicity: ethnicity ?? this.ethnicity,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      informationUpdated: informationUpdated ?? this.informationUpdated,
      isActive: isActive ?? isActive,
      isConfirmed: isConfirmed ?? isConfirmed,
      lastname: lastname ?? this.lastname,
      loginId: loginId ?? this.loginId,
      middleName: middleName ?? this.middleName,
      name: name ?? this.name,
      organization: organization ?? this.organization,
      participantId: participantId ?? this.participantId,
      race: race ?? this.race,
      sex: sex ?? this.sex,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
      formChangePasswordStatus:
          formChangePasswordStatus ?? this.formChangePasswordStatus,
      formResetPassword: formResetPassword ?? this.formResetPassword,
      levelSchool: levelSchool ?? this.levelSchool,
    );
  }

  AuthState initialState(
          {String? project,
          DateOfBirth? birthDate,
          int? statusCode,
          String? token,
          String? userId,
          String? address,
          String? city,
          String? state,
          String? zip,
          String? cellphone,
          String? email,
          String? ethnicity,
          String? gender,
          String? image,
          bool? informationUpdated,
          bool? isActive,
          bool? isConfirmed,
          String? lastname,
          String? loginId,
          String? middleName,
          String? name,
          String? organization,
          String? participantId,
          String? race,
          String? sex,
          String? errorMessage,
          String? message,
          String? levelSchool,
          FormSubmissionStatus? formStatus,
          FormSubmissionStatus? formResetPassword,
          FormSubmissionStatus? formChangePasswordStatus}) =>
      const AuthState(
          project: '',
          birthDate: null,
          state: '',
          statusCode: 404,
          userId: '',
          address: '',
          city: '',
          zip: '',
          cellphone: '',
          email: '',
          ethnicity: '',
          gender: '',
          image: '',
          informationUpdated: true,
          isActive: false,
          isConfirmed: false,
          lastname: '',
          loginId: '',
          middleName: '',
          name: '',
          organization: '',
          participantId: '',
          race: '',
          sex: '',
          errorMessage: '',
          message: '',
          levelSchool: '',
          formChangePasswordStatus: InitialFormStatus(),
          formStatus: InitialFormStatus(),
          formResetPassword: InitialFormStatus());
}
