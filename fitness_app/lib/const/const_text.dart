import 'package:fistness_app_firebase/views/views_shelf.dart';

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
      style: const TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }
}
