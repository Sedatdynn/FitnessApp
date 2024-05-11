import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/core/core_shelf.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/widgets_shelf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/launch_subview.dart';

@RoutePage()
class LaunchView extends StatelessWidget {
  const LaunchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const AppPadding.normalAll(),
        child: ListView(
          children: [
            CustomSize.largeHeight(),
            const LogoBody(),
            const _TitleTextWidget(),
            CustomSize.xxLargeHeight(),
            CustomSize.xxLargeHeight(),
            const _EmailButton(),
            CustomSize.largeHeight(),
            const _GoogleButton(),
            CustomSize.xLargeHeight(),
            const _AccountsInfoTextWidget(),
          ],
        ),
      ),
    );
  }
}
