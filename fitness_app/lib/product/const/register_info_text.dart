import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';

import '../../feature/views_shelf.dart';

class RegisterInfoQuestionText extends StatelessWidget {
  final String text;
  const RegisterInfoQuestionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.titleLarge,
    );
  }
}
