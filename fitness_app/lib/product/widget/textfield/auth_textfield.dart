import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData icon;

  const AuthTextField(
      {super.key,
      required this.onChanged,
      required this.validator,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: context.textTheme.titleSmall,
      cursorColor: AppColors.whiteText,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: AppColors.mainPrimary,
        ),
        hintText: hintText,
      ),
    );
  }
}
