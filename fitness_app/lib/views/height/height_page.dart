// ignore_for_file: prefer_const_constructors

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC4FB6D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _logoBody(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
              ),
              _myText(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              _myButton(),
            ],
          ),
        ),
      ),
    );
  }

  _logoBody() {
    String image_path = "assets/logo.png";
    return Container(
      height: 200,
      child: Image.asset(image_path),
      alignment: Alignment.center,
    );
  }

  _myText() {
    return Text(
      questionsText.heightText,
      style: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  _myButton() {
    Size mediaQuery = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: mediaQuery.height * 0.06,
        width: mediaQuery.width * 0.81,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
          ),
          onPressed: () {
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
          },
          child: Text(myText.nextText,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
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
          margin: EdgeInsets.only(left: 12.0),
          child: Text(
            registerText.cmText,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        )
      ],
    );
  }
}
