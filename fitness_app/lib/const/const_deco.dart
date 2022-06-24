import 'package:fistness_app_firebase/views/views_shelf.dart';

BoxDecoration commonBoxDec(Color? color1, Color? color2, Color? color3) =>
    BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          offset: Offset(5, 1),
          blurRadius: 20,
          color: color1!,
        )
      ],
      gradient: LinearGradient(
          colors: [
            color2!,
            color3!,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
