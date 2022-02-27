// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print, dead_code, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:fistness_app_firebase/views/buttons/launch_page_buttons.dart';
import 'package:fistness_app_firebase/views/login/login_page.dart';
import 'package:fistness_app_firebase/views/register/register_page.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? uid;

  final String? name;
  final String? gender;
  final String? age;
  final String? height;
  final String? weight;
  LaunchPage(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender,
      this.age,
      this.height,
      this.weight})
      : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 120, bottom: 10),
              decoration: BoxDecoration(),
              height: 200,
              child: Image.asset('assets/logo.png'),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "Fitness Is The Key",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 70),
                    height: mediaQueryHeight * 0.06,
                    width: mediaQueryWidth * 0.8,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        textStyle: TextStyle(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    username: widget.username,
                                    mail: widget.mail,
                                    password: widget.password,
                                    uid: widget.uid,
                                    name: widget.name,
                                    gender: widget.gender,
                                    age: widget.age,
                                    height: widget.height,
                                    weight: widget.weight,
                                  )),
                        );
                      },
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign in with Email ',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                "Or log in with: ",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            LaunchPageButtons(
              username: widget.username,
              mail: widget.mail,
              password: widget.password,
              uid: widget.uid,
              name: widget.name,
              gender: widget.gender,
              age: widget.age,
              height: widget.height,
              weight: widget.weight,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Text(
                    "Don't you have an account?",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style:
                          TextStyle(color: Colors.red.shade900, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
