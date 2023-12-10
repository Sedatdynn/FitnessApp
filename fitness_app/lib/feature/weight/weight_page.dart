import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

import '../../product/const/const_shelf.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../../product/widget/loading/app_loading.dart';
import '../views_shelf.dart';

@RoutePage()
class WeightPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final int? age;
  final String? mobility;
  final int? height;
  final String uid;

  const WeightPage(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender,
      this.age,
      this.height,
      this.mobility})
      : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int _currentValue = 65;
  int totalPoint = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: context.minLtrb,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoBody(),
              SizedBox(
                height: context.height / 17,
              ),
              const ConstText(text: QuestionsText.weightText),
              SizedBox(
                height: context.height / 10,
              ),
              _pickerBody(),
              if (isLoading) const LoadingPage(),
              SizedBox(height: context.height * 0.1),
              CommonButton(
                text: MyText.nextText,
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  await registerTheUser();
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickerBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NumberPicker(
          selectedTextStyle:
              Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.mainPrimary),
          textStyle: Theme.of(context).textTheme.titleSmall,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFC4FB6D),
                width: 3.0,
              ),
              bottom: BorderSide(
                color: Color(0xFFC4FB6D),
                width: 3.0,
              ),
            ),
          ),
          value: _currentValue,
          minValue: 30,
          maxValue: 200,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Container(
          margin: context.midLeft,
          child: Text(RegisterText.kgText, style: Theme.of(context).textTheme.titleSmall),
        )
      ],
    );
  }

  Future registerTheUser() async {
    try {
      if (widget.age! <= 20) {
        totalPoint += 5;
      } else if (widget.age! >= 21 && widget.age! <= 35) {
        totalPoint += 4;
      } else if (widget.age! >= 36 && widget.age! <= 50) {
        totalPoint += 3;
      } else if (widget.age! >= 51 && widget.age! <= 65) {
        totalPoint += 2;
      }

      if (_currentValue >= 40 && _currentValue <= 49) {
        totalPoint += 4;
      } else if (_currentValue >= 50 && _currentValue <= 59) {
        totalPoint += 5;
      } else if (_currentValue >= 60 && _currentValue <= 69) {
        totalPoint += 6;
      } else if (_currentValue >= 70 && _currentValue <= 79) {
        totalPoint += 7;
      } else if (_currentValue >= 80 && _currentValue <= 89) {
        totalPoint += 8;
      } else if (_currentValue >= 90 && _currentValue <= 99) {
        totalPoint += 9;
      } else if (_currentValue >= 100 && _currentValue <= 109) {
        totalPoint += 10;
      } else if (_currentValue >= 110 && _currentValue <= 119) {
        totalPoint += 11;
      } else if (_currentValue >= 120 && _currentValue <= 129) {
        totalPoint += 12;
      } else if (_currentValue >= 130 && _currentValue <= 139) {
        totalPoint += 13;
      } else if (_currentValue >= 140 && _currentValue <= 149) {
        totalPoint += 14;
      }

      if (widget.height! >= 160) {
        totalPoint += 2;
      } else {
        totalPoint += 1;
      }

      bool? userGender = widget.gender!.contains("fe");
      if (userGender) {
        totalPoint += 7;
      } else {
        totalPoint += 15;
      }

      String mobilityControl = widget.mobility![0];
      if (mobilityControl == "D") {
        totalPoint += 0;
      } else if (mobilityControl == "B") {
        totalPoint += 2;
      } else if (mobilityControl == "T") {
        totalPoint += 4;
      } else if (mobilityControl == "A") {
        totalPoint += 6;
      }

      Future.delayed(const Duration(seconds: 2));

      bool? isSucces = await AuthService.instance.createPerson(
          model: UserModel(
              username: widget.username!,
              email: widget.mail!,
              name: widget.name!,
              password: widget.password,
              gender: widget.gender!,
              age: widget.age!.toString(),
              mobility: widget.mobility!,
              height: widget.height!.toString(),
              weight: _currentValue.toString(),
              userRightPoint: totalPoint.toString()));

      if (isSucces!) {
        await warningToast(context, RegisterText.registerSuccessfully, color: AppColors.green);
        await warningToast(context, RegisterText.verifyWarning, color: AppColors.green);
        await AuthService.instance.sendEmailVerified();
        AutoRouter.of(context).pushAndPopUntil(LoginRoute(canPop: false), predicate: (_) => false);
      } else {
        setState(() {
          isLoading = false;
        });
        setState(() {
          isLoading = false;
        });
        await warningToast(context, WarningText.registerUniqueMail);
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      await warningToast(context, error.toString());
      print(error);
    }
  }
}
