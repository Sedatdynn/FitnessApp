import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';

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
      style: context.textTheme.titleLarge,
    ).tr();
  }
}
