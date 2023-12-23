import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/enum/image/png/image_path.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/button/auth_button.dart';
import 'package:fistness_app_firebase/product/widget/logo/logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/launch_subview.dart';

@RoutePage()
class LaunchView extends StatelessWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const AppPadding.normalAll(),
        child: ListView(
          children: [
            const LogoBody(),
            const _TitleTextWidget(),
            CustomSize.xxLargeHeight(),
            CustomSize.xxLargeHeight(),
            const _EmailButton(),
            CustomSize.largeHeight(),
            const _GoogleButton(),
            CustomSize.xLargeHeight(),
            const _AccountsInfoTextWidget()
          ],
        ),
      ),
    );
  }
}
