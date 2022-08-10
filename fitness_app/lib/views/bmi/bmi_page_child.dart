import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/bmi/row_value.dart';
import 'package:flutter/material.dart';

import '../../core/const/const_container.dart';

class BmiColumnBody extends StatelessWidget {
  final double width;
  final String userHeight;
  final String userWeight;
  const BmiColumnBody(
      {Key? key,
      required this.width,
      required this.userHeight,
      required this.userWeight})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: context.minAllPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topBox(
                  context,
                  width / 1.16,
                  50,
                  rowValues("Height", userHeight),
                  AllColors.gradColor1,
                  AllColors.gradColor1,
                  AllColors.gradColor4,
                  context.midLargeLtrb,
                  context.zeroAllPadding),
            ],
          ),
        ),
        Padding(
          padding: context.minAllPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topBox(
                  context,
                  width / 1.16,
                  50,
                  rowValues("Weight", userWeight),
                  AllColors.gradColor1,
                  AllColors.gradColor1,
                  AllColors.gradColor4,
                  context.midLargeLtrb,
                  context.zeroAllPadding),
            ],
          ),
        ),
      ],
    );
  }
}
