import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
final class CustomSize extends SizedBox {
  ///  height size 5
  CustomSize.minHeight({super.key}) : super(height: 5.h);

  /// normal height size 10

  CustomSize.normalHeight({super.key}) : super(height: 10.h);

  /// large height size 15

  CustomSize.largeHeight({super.key}) : super(height: 15.h);

  /// xLarge height size 20

  CustomSize.xLargeHeight({super.key}) : super(height: 20.h);

  /// min width size 5

  CustomSize.minWidth({super.key}) : super(width: 5.h);

  /// normal width size 10

  CustomSize.normalWidth({super.key}) : super(width: 10.h);

  /// large width size 14
  CustomSize.largeWidth({super.key}) : super(width: 15.h);

  /// xLarge width size 20
  CustomSize.xLargeWidth({super.key}) : super(width: 20.h);
}
