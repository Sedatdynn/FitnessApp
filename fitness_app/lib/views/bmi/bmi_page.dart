// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/const/const_container.dart';
import 'package:fistness_app_firebase/const/const_deco.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_gauge.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'bmi_page_child.dart';
import 'row_value.dart';

class BmiCalculater extends StatefulWidget {
  String user_height;
  String user_weight;

  BmiCalculater({
    Key? key,
    required this.user_height,
    required this.user_weight,
  }) : super(key: key);

  @override
  State<BmiCalculater> createState() => _BmiCalculaterState();
}

class _BmiCalculaterState extends State<BmiCalculater> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: commonBoxDec(
            allColors.gradColor1, allColors.gradColor2, allColors.gradColor3),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: topBox(
                      context,
                      50,
                      50,
                      Icon(Icons.arrow_back_ios_new, color: Color(0xFFC4FB6D)),
                      allColors.gradColor1,
                      allColors.gradColor1,
                      allColors.gradColor4,
                      EdgeInsets.all(0),
                      EdgeInsets.all(0)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                topBox(
                    context,
                    150,
                    50,
                    Text(
                      "BMI Calculater",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    allColors.gradColor1,
                    allColors.gradColor1,
                    allColors.gradColor4,
                    EdgeInsets.all(10),
                    EdgeInsets.all(0))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            topBox(
                context,
                width / 2.4,
                150,
                bmi_column_body(
                  width: width,
                  user_height: widget.user_height,
                  user_weight: widget.user_weight,
                ),
                allColors.gradColor1.withOpacity(0.5),
                allColors.gradColor5,
                allColors.gradColor6,
                EdgeInsets.all(0),
                EdgeInsets.symmetric(vertical: 18)),
            topBox(
                context,
                width / 1.16,
                50,
                RowValues("BMI Result : ",
                    BmiCalculate(widget.user_height, widget.user_weight)),
                allColors.gradColor1,
                allColors.gradColor1,
                allColors.gradColor4,
                EdgeInsets.fromLTRB(25, 10, 25, 10),
                EdgeInsets.all(8)),
            bmiGauge1(
                context, BmiCalculate(widget.user_height, widget.user_weight))
          ],
        ),
      ),
    );
  }

  String BmiCalculate(dynamic length, dynamic weight) {
    double finalresult =
        int.parse(weight) / (int.parse(length) * int.parse(length) / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    return bmi;
  }
}
