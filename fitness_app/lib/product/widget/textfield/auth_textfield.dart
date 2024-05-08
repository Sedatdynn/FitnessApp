import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';

/// TextFormField widget for using in different screens
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.onChanged,
    required this.validator,
    required this.hintText,
    required this.icon,
    super.key,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: context.textTheme.titleSmall,
      cursorColor: AppColors.whiteText,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: validator,
      decoration: _textfieldDecoration(context),
    );
  }

  InputDecoration _textfieldDecoration(BuildContext context) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: AppColors.mainPrimary,
      ),
      hintText: hintText,
      hintStyle: context.textTheme.bodyLarge,
    );
  }
}
