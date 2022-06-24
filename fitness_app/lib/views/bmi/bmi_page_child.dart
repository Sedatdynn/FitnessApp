import 'package:fistness_app_firebase/const/const_container.dart';
import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/bmi/row_value.dart';
import 'package:flutter/material.dart';

class bmi_column_body extends StatelessWidget {
  const bmi_column_body({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

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
              GestureDetector(
                child: topBox(
                    context,
                    width / 1.16,
                    50,
                    RowValues("Height", "192"),
                    allColors.gradColor1,
                    allColors.gradColor1,
                    allColors.gradColor4,
                    EdgeInsets.fromLTRB(25, 10, 25, 10),
                    EdgeInsets.all(0)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: topBox(
                    context,
                    width / 1.16,
                    50,
                    RowValues("Weight", "83"),
                    allColors.gradColor1,
                    allColors.gradColor1,
                    allColors.gradColor4,
                    EdgeInsets.fromLTRB(25, 10, 25, 10),
                    EdgeInsets.all(0)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
