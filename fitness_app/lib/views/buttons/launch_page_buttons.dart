// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/services/auth_service.dart';
import 'package:fistness_app_firebase/views/home/home_page.dart';
import 'package:flutter/material.dart';

class LaunchPageButtons extends StatefulWidget {
  const LaunchPageButtons({Key? key}) : super(key: key);

  @override
  _LaunchPageButtonsState createState() => _LaunchPageButtonsState();
}

class _LaunchPageButtonsState extends State<LaunchPageButtons> {
  bool isLoading = false;
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.82,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/google.png',
                        height: 27,
                      ),
                      onPressed: loginWithGoogle,
                      label: Text(
                        " Google ",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade200),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/facebook.png',
                        height: 23,
                      ),
                      onPressed: () {},
                      label: Text(
                        "Facebook",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff4267B2)),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    ),
                  ),
                ],
              ),
            ),
          )
        : CircularProgressIndicator();
  }

  void loginWithGoogle() {
    try {
      _authService.signInWithGoogle().then((value) async {
        return await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      });
    } catch (e) {
      debugPrint("HATAAAAAA: " + e.toString());
    }
  }
}
