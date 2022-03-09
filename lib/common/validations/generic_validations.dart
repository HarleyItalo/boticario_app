class GenericValidations {
  static bool emailIsValid(String email) {
    if (isNullOrEmpty(email)) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isNullOrEmpty(String? value, {int minLenght = 2}) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return value.length < minLenght;
  }
}
