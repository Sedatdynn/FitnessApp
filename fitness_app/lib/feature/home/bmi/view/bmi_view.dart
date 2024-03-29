import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../product/const/const_deco.dart';
import '../../../../product/const/responsive/paddings.dart';
import '../../../../product/const/responsive/responsive.dart';
import '../../../../product/const/responsive/space.dart';
import '../../../../product/global/cubit/global_cubit.dart';
import '../../../../product/global/service/global_service.dart';
import '../../../../product/theme/colors.dart';
import '../../../../product/widget/appBar/custom_app_bar.dart';
import '../../../views_shelf.dart';
import '../widget/bmi_gauge.dart';

part '../widget/bmi_widget.dart';

@RoutePage()
class BmiCalculatorView extends StatelessWidget {
  const BmiCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.normalAll(),
          child: BmiWidget(
            width: context.width,
            userHeight: context.watch<GlobalCubit>().user.height ?? 0,
            userWeight: context.watch<GlobalCubit>().user.weight ?? 0,
          ),
        ));
  }
}
