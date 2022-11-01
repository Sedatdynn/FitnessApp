// ignore_for_file: avoid_print, invalid_return_type_for_catch_error, use_build_context_synchronously

import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/service/foods_exercises_service.dart';
import 'package:fistness_app_firebase/views/service/project_network.dart';
import '../../core/const/const_shelf.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class WeightPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final String? age;
  final String? height;
  final String uid;

  const WeightPage({
    Key? key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
    this.age,
    this.height,
  }) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int _currentValue = 65;

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
              ConstText(text: QuestionsText.weightText),
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
              context.headline6(context)?.copyWith(color: context.mainColor),
          textStyle: context.subtitle2(context),
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
          child: Text(
            RegisterText.kgText,
            style: context.subtitle2(context),
          ),
        )
      ],
    );
  }

  Future registerTheUser() async {
    try {
      bool? isSucces = await GeneralService(
              ProjectNetworkManager.instance.service, "/register")
          .registerUser({
        "username": widget.username!,
        "email": widget.mail!,
        "password": widget.password!,
        "sex": widget.gender!,
        "age": widget.age!,
        "height": widget.height!,
        "weight": _currentValue.toString(),
      });
      if (isSucces!) {
        await warningToast(context, RegisterText.registerSuccesfully,
            color: context.greenColor);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
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
