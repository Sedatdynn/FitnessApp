// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, unused_field, empty_statements

import 'package:fistness_app_firebase/services/auth_service.dart';
import 'package:fistness_app_firebase/views/age/age_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GenderPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  const GenderPage(
      {Key? key, this.username, this.mail, this.name, this.password})
      : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  late List<bool> isSelected;
  bool _isLoading = false;
  final AuthService _authService = AuthService();
  var choice = "";

  @override
  void initState() {
    super.initState();
    isSelected = [true, false];
  }

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
          child: Center(
            child: Column(
              children: [
                _logoBody(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                _myText(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                _toggleButton(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                myButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _toggleButton() {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(16.0),
      children: [
        Column(
          children: [
            Icon(Icons.male,
                size: MediaQuery.of(context).size.height / 6,
                color:
                    isSelected[0] == false ? Colors.grey : Colors.red.shade900),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Woman",
                style: TextStyle(
                    fontSize: 16.0,
                    color: isSelected[0] == false
                        ? Colors.grey
                        : Colors.red.shade900),
              ),
            )
          ],
        ),
        Column(
          children: [
            Icon(Icons.female,
                size: MediaQuery.of(context).size.height / 6,
                color:
                    isSelected[0] == true ? Colors.grey : Colors.blue.shade900),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Man",
                style: TextStyle(fontSize: 16.0),
              ),
            )
          ],
        )
      ],
      isSelected: isSelected,
      onPressed: (index) {
        setState(() {
          for (var i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
              choiceControl();
            } else {
              isSelected[i] = false;
            }
          }
        });
      },
      color: Colors.grey,
    );
  }

  _logoBody() {
    return Container(
      height: 200,
      child: Image.asset('assets/logo.png'),
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
          onPressed: _registerOnTap,
          child: Text('Contiune',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    );
  }

  _myText() {
    return Text(
      "What is your sex?",
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
    );
  }

  void _registerOnTap() {
    if (isSelected.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AgePage(
                    mail: widget.mail,
                    username: widget.username,
                    password: widget.password,
                    name: widget.name,
                    gender: choiceControl().toString(),
                  )));
    } else {
      _warningToast("You should choice your sex!");
    }
  }

  Future<bool?> _warningToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14);
  }

  choiceControl() {
    if (isSelected[0] == true) {
      choice = "Woman";
    } else {
      choice = "Man";
    }
    return choice;
  }
}
