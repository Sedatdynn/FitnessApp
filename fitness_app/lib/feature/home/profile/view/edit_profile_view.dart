import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:fistness_app_firebase/product/global/service/global_service.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../views_shelf.dart';
part '../widget/profile_widget.dart';

@RoutePage()
class UpdateInfosView extends StatelessWidget {
  const UpdateInfosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const AppPadding.normalHorizontal(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Update your information', style: context.textTheme.titleLarge),
              CustomSize.xxLargeHeight(),
              CustomSize.xxLargeHeight(),
              _HeightWeightTextField(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  int newValue = int.parse(val);
                  context.read<GlobalCubit>().updateUserHeight(newValue);
                },
                hintText: 'Height ${context.read<GlobalCubit>().user.height}',
                icon: Icons.height,
              ),
              CustomSize.normalHeight(),
              _HeightWeightTextField(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  int newValue = int.parse(val);
                  context.read<GlobalCubit>().updateUserWeight(newValue);
                },
                hintText: 'Weight ${context.read<GlobalCubit>().user.weight}',
                icon: Icons.line_weight,
              ),
              CustomSize.normalHeight(),
              const _DropDownWidget(),
              CustomSize.largeHeight(),
              CommonButton(
                  text: 'Update',
                  onPressed: () async {
                    context.read<GlobalCubit>().updateUserRightPoint();
                    await AuthService.instance.updateData(model: context.read<GlobalCubit>().user);
                    warningToast("Your information updated successfully", color: AppColors.green);
                    await Future.delayed(const Duration(seconds: 2));
                    RouteManager.instance.pushAndPopLast(const BmiCalculatorRoute());
                  })
            ],
          ),
        ));
  }
}
