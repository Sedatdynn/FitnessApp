extension ValidateRegexExtension on String {
  bool get isEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  bool get isName => RegExp(r'^\S.+$').hasMatch(this);
  bool get isPassword => RegExp(r'^(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,}$').hasMatch(this);
}
