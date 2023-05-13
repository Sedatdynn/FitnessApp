import '../../../../feature/views_shelf.dart';

enum ImagePath {
  diet_exrcs,
  diet_list,
  exercise,
  facebook,
  google,
  main_exercises;

  String get rawValue => "assets/png/$name.png";
  Widget toPng(BuildContext context) {
    return Image.asset(rawValue);
  }
}
