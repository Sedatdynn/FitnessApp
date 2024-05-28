import 'package:flutter/material.dart';

class RegisterInfoQuestionText extends StatelessWidget {
  const RegisterInfoQuestionText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
