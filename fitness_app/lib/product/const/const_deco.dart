import '../../feature/views_shelf.dart';

BoxDecoration commonBoxDecoration(Color? color1, Color? color2, Color? color3) => BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      boxShadow: [
        BoxShadow(
          offset: const Offset(5, 1),
          blurRadius: 20,
          color: color1!,
        )
      ],
      gradient: LinearGradient(
          colors: [
            color2!,
            color3!,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
