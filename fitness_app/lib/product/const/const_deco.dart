import 'package:fistness_app_firebase/feature/views_shelf.dart';

BoxDecoration commonBoxDecoration(Color? color1, Color? color2, Color? color3) => BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          offset: const Offset(5, 1),
          blurRadius: 20,
          color: color1!,
        ),
      ],
      gradient: LinearGradient(
        colors: [
          color2!,
          color3!,
        ],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.bottomRight,
        stops: const [0.0, 1.0],
      ),
    );
