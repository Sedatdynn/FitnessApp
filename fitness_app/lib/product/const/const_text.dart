import 'package:fistness_app_firebase/product/extensions/theme_extension.dart';

import '../../feature/views_shelf.dart';

class ConstText extends StatelessWidget {
  final String text;
  const ConstText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.headline6(context),
    );
  }
}
