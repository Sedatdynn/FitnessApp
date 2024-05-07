import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';

import '../../feature/views_shelf.dart';

class RegisterInfoQuestionText extends StatelessWidget {
  const RegisterInfoQuestionText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.titleLarge,
    ).tr();
  }
}
