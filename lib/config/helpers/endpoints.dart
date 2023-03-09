import 'package:Tellme/config/config.dart';

class Endpoints {
  //  Endpoint para autenticarse (Login). Acepta POST.
  static const String login = '${Config.baseURL}auth/login';
  static const String getUser =
      '${Config.baseURL}profile?project=ChelseaProject';
  static const String resetPassword = '${Config.baseURL}auth/reset-password';
  static const String changePassword = '${Config.baseURL}users/reset';
  //  Endpoint para editMedicalHistory (EditMedicalHistory). Acepta POST.
  static const String editMedicalHistory = '${Config.baseURL}formmedical/';
  //  Endpoint para viewMedicalHistory (ViewMedicalHistory). Acepta GET.
  static const String viewMedicalHistory = '${Config.baseURL}formmedical/list/';
  static const String testHistory = '${Config.baseURL}tests/list/';
  static const String viewTest = '${Config.baseURL}tests/detail/';

//Validate antigen Endpoint
  static const String validateAntigen = '${Config.baseURL}codevalidator';

//Validate pcr endpoint
  static const String validatePcr = '${Config.baseURL}codepcrvalidator';
  static const String registerTest = "${Config.baseURL}forms";

  static const String testools = '${Config.baseURL}testools';
}
