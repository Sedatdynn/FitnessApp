import 'package:flutter/material.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/bmi/row_value.dart';
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
    return SizedBox(
      height: context.height * 0.3,
      child: Column(
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
                    rowValues(context, "Height", userHeight),
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
                    rowValues(context, "Weight", userWeight),
                    AllColors.gradColor1,
                    AllColors.gradColor1,
                    AllColors.gradColor4,
                    context.midLargeLtrb,
                    context.zeroAllPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
