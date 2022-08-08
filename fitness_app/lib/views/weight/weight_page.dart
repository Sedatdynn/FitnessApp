// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_field
import 'package:fistness_app_firebase/const/const_appbar.dart';
import 'package:fistness_app_firebase/const/const_button.dart';
import 'package:fistness_app_firebase/const/const_text.dart';
import 'package:fistness_app_firebase/const/const_logo_body.dart';
import 'package:fistness_app_firebase/extensions/edge_insets.dart';
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

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: context.minLtrb,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoBody(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
              ),
              ConstText(text: questionsText.weightText),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              CommonButton(
                text: myText.nextText,
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
          selectedTextStyle: TextStyle(color: Colors.red, fontSize: 20.0),
          textStyle: TextStyle(fontSize: 14.0, color: Colors.white),
          decoration: BoxDecoration(
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
            registerText.kgText,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
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
        _isLoading = true;
      });

      try {
        myText.authService
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
          _warningToast(registerText.registerSuccesfully);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);
        }).catchError((error) {
          if (error.toString().contains("email-already-in-use")) {
            _warningToast(warningText.registerUniqueMail);
          }
        }).whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (e) {
        if (e.toString().contains("email-already-in-use")) {
          _warningToast(warningText.registerUniqueMail);
        }
      }
    } else {
      _warningToast(warningText.errorText);
    }
  }

  void registerUser() async {
    dynamic user = await myText.authService.createPerson(
        widget.username!,
        widget.mail!,
        widget.uid,
        widget.name!,
        widget.gender!,
        widget.age!,
        widget.height!,
        _currentValue.toString());

    if (user) {
      _warningToast(registerText.registerSuccesfully);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }
}

Future<bool?> _warningToast(String text) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14);
}
