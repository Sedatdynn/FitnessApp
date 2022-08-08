// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/const/const_appbar.dart';
import 'package:fistness_app_firebase/const/const_button.dart';
import 'package:fistness_app_firebase/const/const_text.dart';
import 'package:fistness_app_firebase/const/const_logo_body.dart';
import 'package:fistness_app_firebase/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class HeightPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final String? age;
  final String uid;
  const HeightPage(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender,
      this.age})
      : super(key: key);

  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  int _currentValue = 160;

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
              ConstText(
                text: questionsText.heightText,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              CommonButton(
                text: myText.nextText,
                onPressed: _onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WeightPage(
                username: widget.username,
                mail: widget.mail,
                password: widget.password,
                uid: widget.uid,
                name: widget.name,
                gender: widget.gender,
                age: widget.age,
                height: _currentValue.toString(),
              )),
    );
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
          value: (_currentValue),
          minValue: 100,
          maxValue: 220,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Container(
          margin: context.midLeft,
          child: Text(
            registerText.cmText,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        )
      ],
    );
  }
}
