class UtilsStringPasword {
  
  static bool isValidPassword(String password) {
    RegExp validPassword = RegExp(r"[azAZ09]");
    return validPassword.hasMatch(password) &&
        stringContainsNumbers(password) &&
        stringContainsLetters(password);
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