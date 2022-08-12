import 'package:flutter/material.dart';

extension AllPaddings on BuildContext {
  EdgeInsets get zeroAllPadding => const EdgeInsets.all(0);
  EdgeInsets get minAllPadding => const EdgeInsets.all(8.0);
  EdgeInsets get minMidAllPadding => const EdgeInsets.all(10.0);

  EdgeInsets get midAllPadding => const EdgeInsets.all(16.0);
  EdgeInsets get largeAllPadding => const EdgeInsets.all(20.0);
}

extension Size on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension SymetricPadding on BuildContext {
  EdgeInsets get midVerticalPadding =>
      const EdgeInsets.symmetric(vertical: 16.0);
  EdgeInsets get midLargeVerticalPadding =>
      const EdgeInsets.symmetric(vertical: 18.0);

  EdgeInsets get largeHorizontalPadding =>
      const EdgeInsets.symmetric(horizontal: 45.0);

  EdgeInsets get symVertPadding =>
      const EdgeInsets.symmetric(horizontal: 12, vertical: 4);
}

extension OnlyPadding on BuildContext {
  EdgeInsets get minLeft => const EdgeInsets.only(left: 8.0);
  EdgeInsets get midLeft => const EdgeInsets.only(left: 12.0);
  EdgeInsets get midTop => const EdgeInsets.only(top: 70);
  EdgeInsets get riBottom => const EdgeInsets.only(right: 10.0, bottom: 5);
  EdgeInsets get minTopBottom => const EdgeInsets.only(top: 32.0, bottom: 5);
  EdgeInsets get midTopBottom => const EdgeInsets.only(top: 120, bottom: 10);
}

extension LtrbPadding on BuildContext {
  EdgeInsets get minLtrb => const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0);
  EdgeInsets get minMidLtrb => const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 5.0);
  EdgeInsets get minLargeLtrb =>
      const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 5.0);

  EdgeInsets get midLtrb => const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0);
  EdgeInsets get midLargeLtrb =>
      const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0);
  EdgeInsets get largeLtrb => const EdgeInsets.fromLTRB(16.0, 16.0, 20.0, 16.0);
  EdgeInsets get xLargeLtrb => const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 5.0);
}
