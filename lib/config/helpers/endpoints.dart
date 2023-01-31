import 'package:personal_project/config/config.dart';

class Endpoints {
  //  Endpoint para autenticarse (Login). Acepta POST.
  static const String login = '${Config.baseURL}login';
  static const String getUser = '${Config.baseURL}users/';
  static const String resetPassword = '${Config.baseURL}users/reset-password';
  static const String changePassword = '${Config.baseURL}users/reset';
  //  Endpoint para editMedicalHistory (EditMedicalHistory). Acepta POST.
  static const String editMedicalHistory = '${Config.baseURL}formmedical/';
  //  Endpoint para viewMedicalHistory (ViewMedicalHistory). Acepta GET.
  static const String viewMedicalHistory = '${Config.baseURL}formmedical/list/';
  static const String testHistory = '${Config.baseURL}tests/list/';
}
