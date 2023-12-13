import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';

import '../../product/const/const_container.dart';
import '../../product/const/const_deco.dart';
import '../views_shelf.dart';
import 'bmi_gauge.dart';
import 'bmi_page_child.dart';
import 'row_value.dart';

@RoutePage()
class BmiCalculatorView extends StatefulWidget {
  const BmiCalculatorView({
    Key? key,
  }) : super(key: key);

  @override
  State<BmiCalculatorView> createState() => _BmiCalculatorViewState();
}

class _BmiCalculatorViewState extends State<BmiCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AuthService.instance.fetchCurrentUserDoc(),
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
                      decoration: commonBoxDec(
                          AllColors.gradColor1, AllColors.gradColor2, AllColors.gradColor3),
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
                                    const Icon(Icons.arrow_back_ios_new, color: Color(0xFFC4FB6D)),
                                    AllColors.gradColor1,
                                    AllColors.gradColor1,
                                    AllColors.gradColor4,
                                    context.zeroAllPadding,
                                    context.zeroAllPadding),
                                onTap: () {
                                  RouteManager.instance.pushNamed(path: RouteConstants.profile);
                                },
                              ),
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
                            const AppPadding.normalVertical(),
                          ),
                          topBox(
                              context,
                              context.width / 1.16,
                              50,
                              rowValues(context, "BMI Result : ",
                                  bmiCalculate(snapshot.data?["height"], snapshot.data?["weight"])),
                              AllColors.gradColor1,
                              AllColors.gradColor1,
                              AllColors.gradColor4,
                              context.midLargeLtrb,
                              context.midAllPadding),
                          bmiGauge1(context,
                              bmiCalculate(snapshot.data?["height"], snapshot.data?["weight"]))
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  String bmiCalculate(dynamic height, dynamic weight) {
    double finalresult = int.parse(weight) / (int.parse(height) * int.parse(height) / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    return bmi;
  }
}
