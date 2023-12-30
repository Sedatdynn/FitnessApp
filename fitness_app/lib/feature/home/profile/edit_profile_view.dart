import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/global/service/global_service.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/const/responsive/paddings.dart';
import '../../../product/const/responsive/space.dart';
import '../../../product/global/cubit/global_cubit.dart';
import '../../../product/widget/button/common_button.dart';
import '../../../product/widget/textfield/auth_textfield.dart';
import '../../views_shelf.dart';

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
              AuthTextField(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  int newValue = int.parse(val);
                  context.read<GlobalCubit>().updateUserHeight(newValue);
                },
                validator: (value) => null,
                hintText: 'Height ${context.read<GlobalCubit>().user.height}',
                icon: Icons.height,
              ),
              CustomSize.normalHeight(),
              AuthTextField(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  int newValue = int.parse(val);
                  context.read<GlobalCubit>().updateUserWeight(newValue);
                },
                validator: (value) => null,
                hintText: 'Weight ${context.read<GlobalCubit>().user.weight}',
                icon: Icons.line_weight,
              ),
              CustomSize.normalHeight(),
              const _DropDownWidget(),
              CustomSize.normalHeight(),
              CommonButton(
                  text: 'Update',
                  onPressed: () async {
                    context.read<GlobalCubit>().updateUserRightPoint();
                    await AuthService.instance.updateData(model: context.read<GlobalCubit>().user);
                    warningToast("Your information updated successfully", color: AppColors.green);
                    Future.delayed(const Duration(seconds: 2));
                    RouteManager.instance.pushAndPopLast(const BmiCalculatorRoute());
                  })
            ],
          ),
        ));
  }
}

class _DropDownWidget extends StatelessWidget {
  const _DropDownWidget();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        hint: const Center(child: Text('select')),
        dropdownColor: Colors.deepPurpleAccent,
        isExpanded: true,
        value: context.watch<GlobalCubit>().user.mobility,
        style: context.textTheme.titleSmall,
        underline: Container(height: 2.h, color: Colors.deepPurpleAccent),
        onChanged: (String? value) => context.read<GlobalCubit>().updateUserMobility(value!),
        items: GlobalService().items.map((e) {
          return _dropdownMenuItem(e);
        }).toList());
  }

  DropdownMenuItem<String> _dropdownMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Center(child: Text(item.toString())));
}
