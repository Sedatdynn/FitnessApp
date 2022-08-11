import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';

import '../../core/const/const_shelf.dart';
import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
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
                height: MediaQuery.of(context).size.height / 17,
              ),
              ConstText(text: QuestionsText.weightText),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              CommonButton(
                text: MyText.nextText,
                onPressed: _tryAndCatch,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tryAndCatch() {
    try {
      if (widget.password!.isNotEmpty) {
        _registerOnTap();
      } else {
        registerUser();
      }
    } catch (e) {
      registerUser();
    }
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

  void _registerOnTap() {
    if (widget.username.toString().isNotEmpty &&
        widget.mail.toString().isNotEmpty &&
        widget.password.toString().isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      try {
        MyText.authService
            .createPersonEmail(
                widget.username!,
                widget.mail!,
                widget.password!,
                widget.uid,
                widget.name!,
                widget.gender!,
                widget.age!,
                widget.height!,
                _currentValue.toString())
            .then((value) {
          _warningToast(
              RegisterText.registerSuccesfully, context, context.greenColor);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
        }).catchError((error) {
          if (error.toString().contains("email-already-in-use")) {
            _warningToast(
                WarningText.registerUniqueMail, context, context.mainColor);
          }
        }).whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
      } catch (e) {
        if (e.toString().contains("email-already-in-use")) {
          _warningToast(
              WarningText.registerUniqueMail, context, context.mainColor);
        }
      }
    } else {
      _warningToast(WarningText.errorText, context, context.mainColor);
    }
  }

  void registerUser() async {
    dynamic user = await MyText.authService.createPerson(
        widget.username!,
        widget.mail!,
        widget.uid,
        widget.name!,
        widget.gender!,
        widget.age!,
        widget.height!,
        _currentValue.toString());

    if (user) {
      _warningToast(
          RegisterText.registerSuccesfully, context, context.greenColor);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    }
  }
}

Future<bool?> _warningToast(String text, BuildContext context, Color color) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: color, //context.mainColor
      textColor: context.textColor,
      fontSize: 14);
}
