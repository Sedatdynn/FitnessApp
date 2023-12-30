import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/const/responsive/paddings.dart';
import '../../../product/const/responsive/space.dart';
import '../../../product/global/cubit/global_cubit.dart';
import '../../../product/widget/button/common_button.dart';
import '../../../product/widget/textfield/auth_textfield.dart';
import '../../views_shelf.dart';

@RoutePage()
class UpdateInfosView extends StatefulWidget {
  const UpdateInfosView({Key? key}) : super(key: key);
  @override
  State<UpdateInfosView> createState() => _UpdateInfosViewState();
}

class _UpdateInfosViewState extends State<UpdateInfosView> {
  int totalPoint = 0;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController mobilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const AppPadding.normalHorizontal(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthTextField(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  int newValue = int.parse(val);
                  context.read<GlobalCubit>().updateUserHeight(newValue);
                },
                validator: (value) {},
                hintText: 'Height ${context.read<GlobalCubit>().user.height}',
                icon: Icons.height,
              ),
              CustomSize.normalHeight(),

              AuthTextField(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  int newValue = int.parse(val);
                  context.read<GlobalCubit>().updateUserWeight(newValue);
                },
                validator: (value) {},
                hintText: 'Weight ${context.read<GlobalCubit>().user.weight}',
                icon: Icons.line_weight,
              ),
              CustomSize.normalHeight(),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                controller: weightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  // labelText: "weight -> ${snapshot.data?["weight"]}"
                  labelText: "weight -> ${context.read<GlobalCubit>().user.weight}",
                ),
              ),

              CommonButton(text: 'Update', onPressed: () {})
              // CommonButton(
              //     text: "Update",
              //     onPressed: () {
              //       Map<String, dynamic> dataToUpdate = {
              //         "weight": (weightController.text.isNotEmpty)
              //             ? weightController.text
              //             : snapshot.data?["weight"],
              //         "height": (heightController.text.isNotEmpty)
              //             ? heightController.text
              //             : snapshot.data?["height"],
              //       };
              //       int age = int.parse(snapshot.data?["age"]);
              //       if (age <= 20) {
              //         totalPoint += 5;
              //       } else if (age >= 21 && age <= 35) {
              //         totalPoint += 4;
              //       } else if (age >= 36 && age <= 50) {
              //         totalPoint += 3;
              //       } else if (age >= 51 && age <= 65) {
              //         totalPoint += 2;
              //       }
              //       int weight = int.parse(snapshot.data?["weight"]);
              //       if (weight >= 40 && weight <= 49) {
              //         totalPoint += 4;
              //       } else if (weight >= 50 && weight <= 59) {
              //         totalPoint += 5;
              //       } else if (weight >= 60 && weight <= 69) {
              //         totalPoint += 6;
              //       } else if (weight >= 70 && weight <= 79) {
              //         totalPoint += 7;
              //       } else if (weight >= 80 && weight <= 89) {
              //         totalPoint += 8;
              //       } else if (weight >= 90 && weight <= 99) {
              //         totalPoint += 9;
              //       } else if (weight >= 100 && weight <= 109) {
              //         totalPoint += 10;
              //       } else if (weight >= 110 && weight <= 119) {
              //         totalPoint += 11;
              //       } else if (weight >= 120 && weight <= 129) {
              //         totalPoint += 12;
              //       } else if (weight >= 130 && weight <= 139) {
              //         totalPoint += 13;
              //       } else if (weight >= 140 && weight <= 149) {
              //         totalPoint += 14;
              //       } else if (weight >= 140 && weight <= 149) {
              //         totalPoint += 14;
              //       }
              //       int height = int.parse(snapshot.data?["height"]);
              //       if (height >= 160) {
              //         totalPoint += 2;
              //       } else {
              //         totalPoint += 1;
              //       }
              //       bool? userGender = snapshot.data?["gender"].contains("fe");
              //       if (userGender!) {
              //         totalPoint += 7;
              //       } else {
              //         totalPoint += 15;
              //       }
              //       String mobilityControl = snapshot.data?["mobility"][0];
              //       if (mobilityControl == "D") {
              //         totalPoint += 0;
              //       } else if (mobilityControl == "B") {
              //         totalPoint += 2;
              //       } else if (mobilityControl == "T") {
              //         totalPoint += 4;
              //       } else if (mobilityControl == "A") {
              //         totalPoint += 6;
              //       }

              //       Map<String, dynamic> userPointUpdate = {"userRightPoint": totalPoint};
              //       CollectionReference collection =
              //           FirebaseFirestore.instance.collection("users");
              //       DocumentReference doc =
              //           collection.doc(FirebaseAuth.instance.currentUser!.uid);
              //       doc.update(dataToUpdate);
              //       doc.update(userPointUpdate);
              //       warningToast("Your update completed successfully",
              //           color: AppColors.green);
              //       Future.delayed(const Duration(seconds: 2));
              //       RouteManager.instance.pushNamed(path: RouteConstants.bmiCalculator);
              //     })
            ],
          ),
        ));
  }
}
