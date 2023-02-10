

class UtilsEmailUser {
  static bool validateUserName(String userName) {
    final RegExp emailValidatorRegExp =
        RegExp(r"[a-zA-Z0-9]");
    return emailValidatorRegExp.hasMatch(userName);
  }

  static bool validateEmail(String email) {
    final RegExp emailValidatorRegExp =
        RegExp(r"[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]");
    return emailValidatorRegExp.hasMatch(email);
  }
}