// ignore_for_file: constant_identifier_names

import '../../../../feature/views_shelf.dart';

enum ImagePath {
  diet_exrcs,
  diet_list,
  logo,
  exercise,
  facebook,
  google,
  largeExrc,
  main_exercises;

  String get rawValue => "assets/png/$name.png";
  Widget toPng() {
    return Image.asset(rawValue);
  }
}
