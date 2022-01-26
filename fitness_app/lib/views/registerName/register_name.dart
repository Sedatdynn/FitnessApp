// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/views/gender/gender.dart';
import 'package:flutter/material.dart';

class RegisterNamePage extends StatefulWidget {
  const RegisterNamePage({Key? key}) : super(key: key);

  @override
  _RegisterNamePageState createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterNamePage> {
  final TextEditingController _emailController = TextEditingController();
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
        padding: EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _myText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              _nameField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              _mybutton()
            ],
          ),
        ),
      ),
    );
  }

  _myText() {
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
        height: mediaQuery.height * 0.09,
        width: mediaQuery.width * 0.87,
        child: Text(
          "Your Name?",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ));
  }

  _nameField() {
    return TextField(
        controller: _emailController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Your Nmae?',
        ));
  }

  _mybutton() {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.87,
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
              MaterialPageRoute(builder: (context) => GenderPage()),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}
