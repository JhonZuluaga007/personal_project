import 'package:Tellme/config/config.dart';

class Endpoints {
  //  Endpoint para autenticarse (Login). Acepta POST.
  static const String login = '${Config.baseTestURL}auth/login';

  static const String getUser =
      '${Config.baseTestURL}profile?project=ChelseaProject';

  static const String resetPassword = '${Config.baseTestURL}auth/reset-password';

  static const String changePassword =
      '${Config.baseTestURL}profile/change-password';
  //  Endpoint para editMedicalHistory (EditMedicalHistory). Acepta POST.
  static const String editMedicalHistory = '${Config.baseTestURL}profile/edit-medical-history';

  // Endpoint para el edit profile || Acepta un put
  static const String editProfile = '${Config.baseTestURL}profile/edit-profile';
  //  Endpoint para viewMedicalHistory (ViewMedicalHistory). Acepta GET.
  static const String viewMedicalHistory =
      '${Config.baseTestURL}profile/medical-history?project=ChelseaProject';
  static const String testHistory =
      '${Config.baseTestURL}tests?project=ChelseaProject';

  static const String viewTest = '${Config.baseTestURL}tests/detail/';
  //endpoint to create Support ticket.
  static const String createSupportCase =
      '${Config.baseTestURL}support/create-support-case';

//Validate antigen Endpoint
  static const String validateAntigen = '${Config.baseTestURL}tests/validate-antigen-code';

//Validate pcr endpoint
  static const String validatePcr = '${Config.baseTestURL}tests/validate-pcr-code';

  static const String registerTest = "${Config.baseTestURL}tests/register-antigen-test";

  static const String optionsTools =
      '${Config.baseTestURL}options?project=ChelseaProject';
}
