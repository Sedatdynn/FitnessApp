import 'package:fistness_app_firebase/feature/home/bmi/row_value.dart';
import 'package:fistness_app_firebase/product/const/const_container.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:fistness_app_firebase/product/const/text/texts.dart';

class BmiColumnBody extends StatelessWidget {
  final double width;
  final String userHeight;
  final String userWeight;
  const BmiColumnBody(
      {Key? key, required this.width, required this.userHeight, required this.userWeight})
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
            padding: const AppPadding.minAll(),
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
                  const AppPadding.normalAll(),
                  const AppPadding(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const AppPadding.minAll(),
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
                    const AppPadding.normalAll(),
                    const AppPadding()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
