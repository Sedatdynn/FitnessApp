import '../../../feature/views_shelf.dart';

extension AllPaddings on BuildContext {
  EdgeInsets get zeroAllPadding => const EdgeInsets.all(0);
  EdgeInsets get minAllPadding => const EdgeInsets.all(8);
  EdgeInsets get midAllPadding => const EdgeInsets.all(16);
}

extension SymmetricPadding on BuildContext {
  EdgeInsets get minHorizontal => const EdgeInsets.symmetric(horizontal: 8.0);
  EdgeInsets get minVertical => const EdgeInsets.symmetric(vertical: 8.0);
}
