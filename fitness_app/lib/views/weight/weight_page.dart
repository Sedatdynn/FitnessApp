// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int _currentValue = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
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
                height: MediaQuery.of(context).size.height / 7,
              ),
              _myText(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
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
    return Container(
      height: 200,
      child: Image.asset('assets/logo.png'),
      alignment: Alignment.center,
    );
  }

  _myText() {
    return Text(
      "How much is your weight?",
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
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
            //  Navigator.push(
            //    context,
            //    MaterialPageRoute(builder: (context) => RegisterNamePage()),
            // );
          },
          child: Text('Next',
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
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 3.0,
              ),
              bottom: BorderSide(
                color: Colors.grey,
                width: 3.0,
              ),
            ),
          ),
          value: _currentValue,
          textStyle: TextStyle(fontSize: 14.0),
          minValue: 30,
          maxValue: 200,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Container(
          margin: EdgeInsets.only(left: 12.0),
          child: Text(
            "kg",
            style: TextStyle(fontSize: 16.0),
          ),
        )
      ],
    );
  }
}
