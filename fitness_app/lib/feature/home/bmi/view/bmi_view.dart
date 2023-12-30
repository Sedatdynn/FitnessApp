import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/home/bmi/widget/bmi_gauge.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_deco.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/bmi_widget.dart';

@RoutePage()
class BmiCalculatorView extends StatelessWidget {
  const BmiCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(),
        body: Container(
          padding: const AppPadding.normalAll(),
          child: Column(
            children: [
              BmiWidget(
                width: context.width,
                userHeight: context.watch<GlobalCubit>().user.height ?? '',
                userWeight: context.watch<GlobalCubit>().user.weight ?? '',
              ),
            ],
          ),
        ));
  }
}
