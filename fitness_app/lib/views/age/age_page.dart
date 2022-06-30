// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/views/views_shelf.dart';

class AgePage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String uid;
  final String? name;
  final String? gender;
  const AgePage(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender})
      : super(key: key);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
              Text(
                questionsText.ageText,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              myButton(),
            ],
          ),
        ),
      ),
    );
  }

  _logoBody() {
    String image_path = 'assets/logo.png';
    return Container(
      height: 200,
      child: Image.asset(image_path),
      alignment: Alignment.center,
    );
  }

  myButton() {
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
                  builder: (context) => HeightPage(
                        username: widget.username,
                        mail: widget.mail,
                        password: widget.password,
                        uid: widget.uid,
                        name: widget.name,
                        gender: widget.gender,
                        age: _currentValue.toString(),
                      )),
            );
          },
          child: Text(myText.contiuneText,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    );
  }

  _pickerBody() {
    return NumberPicker(
      selectedTextStyle: TextStyle(color: Colors.red, fontSize: 20.0),
      textStyle: TextStyle(color: Colors.white),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            //                   <--- left side
            color: Color(0xFFC4FB6D),
            width: 3.0,
          ),
          bottom: BorderSide(
            //                    <--- top side
            color: Color(0xFFC4FB6D),
            width: 3.0,
          ),
        ),
      ),
      value: _currentValue,
      minValue: 0,
      maxValue: 100,
      onChanged: (value) => setState(() => _currentValue = value),
    );
  }
}
