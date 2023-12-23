import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget bmiGauge1(BuildContext context, String deger) {
  return Padding(
    padding: const AppPadding.normalVertical(),
    child: Center(
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
          GaugeRange(startValue: 0, endValue: 15, color: AppColors.mainPrimary),
          GaugeRange(startValue: 15, endValue: 18, color: Colors.yellow),
          GaugeRange(startValue: 18, endValue: 25, color: AppColors.green),
          GaugeRange(startValue: 25, endValue: 30, color: Colors.yellow),
          GaugeRange(startValue: 30, endValue: 35, color: Colors.orange),
          GaugeRange(startValue: 35, endValue: 50, color: AppColors.mainPrimary),
        ], pointers: <GaugePointer>[
          NeedlePointer(value: double.parse(deger))
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Text(deger, style: context.textTheme.displaySmall),
              angle: 90,
              positionFactor: 0.5)
        ])
      ]),
    ),
  );
}
