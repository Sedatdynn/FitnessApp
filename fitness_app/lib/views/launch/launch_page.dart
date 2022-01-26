// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print, dead_code

import 'package:fistness_app_firebase/views/buttons/launch_page_buttons.dart';
import 'package:fistness_app_firebase/views/login/login_page.dart';
import 'package:fistness_app_firebase/views/register/register_page.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
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
            SizedBox(
              height: 155,
            ),
            Center(
              child: SizedBox(
                height: mediaQuery.height * 0.06,
                width: mediaQuery.width * 0.81,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: mediaQuery.height * 0.06,
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
                                builder: (context) => LoginPage()),
                          );
                        },
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Sign in with Email ',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
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
            LaunchPageButtons(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
