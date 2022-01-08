// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_pro_project/screens/gender_page.dart';

class RegisterSecondScreen extends StatefulWidget {
  const RegisterSecondScreen({Key? key}) : super(key: key);

  @override
  _RegisterSecondScreenState createState() => _RegisterSecondScreenState();
}

class _RegisterSecondScreenState extends State<RegisterSecondScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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
        padding: EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: mediaQuery.height * 0.09,
                  width: mediaQuery.width * 0.87,
                  child: Text(
                    "Your Name?",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: mediaQuery.height * 0.09,
                width: mediaQuery.width * 0.87,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.red),
                    labelText: "Your Name",
                    prefixIcon: Icon(Icons.perm_identity),
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
              ),
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
                        MaterialPageRoute(builder: (context) => GenderScreen()),
                      );
                    },
                    child: Text('Contiune'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
