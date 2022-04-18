mixin InputValidationMixin {
  bool isPasswordVaild(String password) => password.length == 6;
  bool isEmpty(String text) => text.isEmpty || text == 'null';
  bool isEmailValid(String email) {
    final RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailValid.hasMatch(email);
  }
}
