

class UtilsEmailUser {
  static bool validateUserName(String userName) {
    final RegExp emailValidatorRegExp =
        RegExp(r"[azAZ09]");
    return emailValidatorRegExp.hasMatch(userName) &&
      stringContainsLetters(userName) &&
      stringContainsNumbers(userName);
  }

  static bool validateEmail(String email) {
    final RegExp emailValidatorRegExp =
        RegExp(r"[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z.co]");
    return emailValidatorRegExp.hasMatch(email);
  }

  static bool stringContainsNumbers(String value) {
    RegExp containsNumbers = RegExp(r'[09]');
    return containsNumbers.hasMatch(value);
  }

  static bool stringContainsLetters(String value) {
    RegExp containsLetters = RegExp(r'[AZaz]');
    return containsLetters.hasMatch(value);
  }
}