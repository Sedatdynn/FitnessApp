extension ValidateRegexExtension on String {
  bool get isUsername => RegExp(r'^\S.+$').hasMatch(this);
  bool get isNameSurname =>
      RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖÇ]+( [a-zA-ZğüşıöçĞÜŞİÖÇ]+)+$').hasMatch(this);
  bool get isEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  bool get isPassword => RegExp(r'^(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{6,}$').hasMatch(this);
}
