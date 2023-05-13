import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../product/theme/colors.dart';
import '../views_shelf.dart';

Widget bmiGauge1(BuildContext context, String deger) {
  return Padding(
    padding: context.midVerticalPadding,
    child: Center(
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
          GaugeRange(startValue: 0, endValue: 15, color: AppColors.mainPrimary),
          GaugeRange(startValue: 15, endValue: 18, color: Colors.yellow),
          GaugeRange(startValue: 18, endValue: 25, color: AppColors.green),
          GaugeRange(startValue: 25, endValue: 30, color: Colors.yellow),
          GaugeRange(startValue: 30, endValue: 35, color: Colors.orange),
          GaugeRange(
              startValue: 35, endValue: 50, color: AppColors.mainPrimary),
        ], pointers: <GaugePointer>[
          NeedlePointer(value: double.parse(deger))
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget:
                  Text(deger, style: Theme.of(context).textTheme.displaySmall),
              angle: 90,
              positionFactor: 0.5)
        ])
      ]),
    ),
  );
}
