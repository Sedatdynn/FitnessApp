import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_gauge.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import '../../core/const/const_container.dart';
import '../../core/const/const_deco.dart';
import 'bmi_page_child.dart';
import 'row_value.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({
    Key? key,
  }) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MyText.authService.fetchCurrentUserDoc(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            if (snapshot.hasData) {
              return SizedBox(
                height: context.height,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: context.midAllPadding,
                      decoration: commonBoxDec(AllColors.gradColor1,
                          AllColors.gradColor2, AllColors.gradColor3),
                      child: Column(
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
                              //   topBox(
                              //       context,
                              //       150,
                              //       50,
                              //       Text(
                              //         "BMI Calculator",
                              //         style: context.subtitle1(context),
                              //         textAlign: TextAlign.center,
                              //       ),
                              //       AllColors.gradColor1,
                              //       AllColors.gradColor1,
                              //       AllColors.gradColor4,
                              //       context.minMidAllPadding,
                              //       context.zeroAllPadding)
                              //
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          topBox(
                              context,
                              context.width / 1,
                              150,
                              BmiColumnBody(
                                width: context.width,
                                userHeight: snapshot.data?["height"],
                                userWeight: snapshot.data?["weight"],
                              ),
                              AllColors.gradColor1.withOpacity(0.5),
                              AllColors.gradColor5,
                              AllColors.gradColor6,
                              context.zeroAllPadding,
                              context.midLargeVerticalPadding),
                          topBox(
                              context,
                              context.width / 1.16,
                              50,
                              rowValues(
                                  context,
                                  "BMI Result : ",
                                  bmiCalculate(snapshot.data?["height"],
                                      snapshot.data?["weight"])),
                              AllColors.gradColor1,
                              AllColors.gradColor1,
                              AllColors.gradColor4,
                              context.midLargeLtrb,
                              context.midAllPadding),
                          bmiGauge1(
                              context,
                              bmiCalculate(snapshot.data?["height"],
                                  snapshot.data?["weight"]))
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  String bmiCalculate(dynamic height, dynamic weight) {
    double finalresult =
        int.parse(weight) / (int.parse(height) * int.parse(height) / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    return bmi;
  }
}
