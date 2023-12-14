import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/enum/image/png/image_path.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/button/auth_button.dart';
import '../../views_shelf.dart';

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
            SizedBox(height: 50.h),
            const _EmailButton(),
            SizedBox(height: 15.h),
            const _GoogleButton(),
            SizedBox(height: 25.h),
            const _AccountsInfoTextWidget()
          ],
        ),
      ),
    );
  }
}
