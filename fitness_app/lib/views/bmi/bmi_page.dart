import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_gauge.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import '../../core/const/const_container.dart';
import '../../core/const/const_deco.dart';
import 'bmi_page_child.dart';
import 'row_value.dart';

class BmiCalculater extends StatefulWidget {
  final String userHeight;
  final String userWeight;

  const BmiCalculater({
    Key? key,
    required this.userHeight,
    required this.userWeight,
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
        padding: context.midAllPadding,
        decoration: commonBoxDec(
            AllColors.gradColor1, AllColors.gradColor2, AllColors.gradColor3),
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
                      const Icon(Icons.arrow_back_ios_new,
                          color: Color(0xFFC4FB6D)),
                      AllColors.gradColor1,
                      AllColors.gradColor1,
                      AllColors.gradColor4,
                      context.zeroAllPadding,
                      context.zeroAllPadding),
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
                      style:
                          TextStyle(color: context.textColor, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    AllColors.gradColor1,
                    AllColors.gradColor1,
                    AllColors.gradColor4,
                    context.minMidAllPadding,
                    context.zeroAllPadding)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            topBox(
                context,
                width / 2.4,
                150,
                BmiColumnBody(
                  width: width,
                  userHeight: widget.userHeight,
                  userWeight: widget.userWeight,
                ),
                AllColors.gradColor1.withOpacity(0.5),
                AllColors.gradColor5,
                AllColors.gradColor6,
                context.zeroAllPadding,
                context.midLargeVerticalPadding),
            topBox(
                context,
                width / 1.16,
                50,
                rowValues("BMI Result : ",
                    bmiCalculate(widget.userHeight, widget.userWeight)),
                AllColors.gradColor1,
                AllColors.gradColor1,
                AllColors.gradColor4,
                context.midLargeLtrb,
                context.midAllPadding),
            bmiGauge1(
                context, bmiCalculate(widget.userHeight, widget.userWeight))
          ],
        ),
      ),
    );
  }

  String bmiCalculate(dynamic length, dynamic weight) {
    double finalresult =
        int.parse(weight) / (int.parse(length) * int.parse(length) / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    return bmi;
  }
}
