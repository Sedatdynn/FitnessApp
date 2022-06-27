import 'package:fistness_app_firebase/const/const_container.dart';
import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/bmi/row_value.dart';
import 'package:flutter/material.dart';

class bmi_column_body extends StatelessWidget {
  bmi_column_body(
      {Key? key,
      required this.width,
      required this.user_height,
      required this.user_weight})
      : super(
          key: key,
        );

  final double width;
  String user_height;
  String user_weight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topBox(
                  context,
                  width / 1.16,
                  50,
                  RowValues("Height", "$user_height"),
                  allColors.gradColor1,
                  allColors.gradColor1,
                  allColors.gradColor4,
                  EdgeInsets.fromLTRB(25, 10, 25, 10),
                  EdgeInsets.all(0)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topBox(
                  context,
                  width / 1.16,
                  50,
                  RowValues("Weight", "$user_weight"),
                  allColors.gradColor1,
                  allColors.gradColor1,
                  allColors.gradColor4,
                  EdgeInsets.fromLTRB(25, 10, 25, 10),
                  EdgeInsets.all(0)),
            ],
          ),
        ),
      ],
    );
  }
}
