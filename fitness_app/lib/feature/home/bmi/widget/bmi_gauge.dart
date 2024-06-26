import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/global/global_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiGaugeWidget extends StatelessWidget {
  const BmiGaugeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gaugeRanges = <GaugeRange>[
      GaugeRange(startValue: 0, endValue: 15, color: AppColors.error),
      GaugeRange(startValue: 15, endValue: 18, color: Colors.yellow),
      GaugeRange(startValue: 18, endValue: 25, color: AppColors.green),
      GaugeRange(startValue: 25, endValue: 30, color: Colors.yellow),
      GaugeRange(startValue: 30, endValue: 35, color: Colors.orange),
      GaugeRange(startValue: 35, endValue: 50, color: AppColors.error),
    ];
    return BlocSelector<GlobalCubit, GlobalState, UserModel?>(
      selector: (state) => state.user,
      builder: (context, user) {
        final result = GlobalService().calculateBmi(user: user!);
        return Padding(
          padding: const AppPadding.normalVertical(),
          child: Center(
            child: SfRadialGauge(
              animationDuration: 1,
              axes: <RadialAxis>[
                RadialAxis(
                  maximum: 40,
                  axisLabelStyle: GaugeTextStyle(color: AppColors.mainPrimary, fontSize: 16.sp),
                  majorTickStyle: const MajorTickStyle(thickness: 12, color: AppColors.white),
                  ranges: gaugeRanges,
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: double.parse(result),
                      needleColor: AppColors.keyTextShadowColor,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(result, style: context.textTheme.displaySmall),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
