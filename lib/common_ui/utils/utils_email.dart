

class UtilsEmailUser {
  static bool validateUserName(String userName) {
     final RegExp emailValidatorRegExp =
        RegExp(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");
    return emailValidatorRegExp.hasMatch(userName) ;
   
  }

  static bool validateEmail(String email) {
    final RegExp emailValidatorRegExp =
        RegExp(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");
    return emailValidatorRegExp.hasMatch(email);
  }

  static bool stringContainsNumbers(String value) {
    RegExp containsNumbers = RegExp(r'[09]');
    return containsNumbers.hasMatch(value);
  }
  static bool validateLength(String user){
    if (user.length>4){
      return true;
    }else{
      return false;
    }
  }

  static bool stringContainsLetters(String value) {
    RegExp containsLetters = RegExp(r'[AZaz]');
    return containsLetters.hasMatch(value);
  }
}