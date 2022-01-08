// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro_project/screens/height_page.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _currentValue = 3;

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
              Container(
                height: MediaQuery.of(context).size.height / 6,
                child: new Image.asset('assets/logo.png'),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Text(
                "How old are you?",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              NumberPicker(
                selectedTextStyle: TextStyle(color: Colors.red),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      //                   <--- left side
                      color: Colors.grey,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Colors.grey,
                      width: 3.0,
                    ),
                  ),
                ),
                value: _currentValue,
                minValue: 0,
                maxValue: 100,
                onChanged: (value) => setState(() => _currentValue = value),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.87,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade900),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HeightScreen()),
                      );
                    },
                    child: Text('Next'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
