// ignore_for_file: prefer_const_constructors, invalid_return_type_for_catch_error

import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/home/home_page.dart';
import 'package:fistness_app_firebase/views/registerName/register_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LaunchPageButtons extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? uid;

  final String? name;
  final String? gender;
  final String? age;
  final String? height;
  final String? weight;
  const LaunchPageButtons(
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
  _LaunchPageButtonsState createState() => _LaunchPageButtonsState();
}

class _LaunchPageButtonsState extends State<LaunchPageButtons> {
  bool isLoading = false;

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
                      onPressed: () {
                        loginWithGoogle();
                      },
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

  loginWithGoogle() {
    myText.authService.signInWithGoogle().then((value) async {
      //dynamic check_email = digerFoonks(value.user!.email);
      bool anyUid = await myText.authService.checkUid(value.user!.uid);
      if (anyUid) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      username: widget.username,
                      mail: widget.mail,
                      password: widget.password,
                      uid: widget.uid.toString(),
                      name: widget.name,
                      gender: widget.gender,
                      age: widget.age,
                      height: widget.height,
                      weight: widget.weight,
                    )),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterNamePage(
                      mail: value.user!.email,
                      uid: value.user!.uid,
                      username: value.user!.displayName,
                    )),
            (route) => false);
      }
    }).catchError((error) => debugPrint(error));
  }

  Future<bool?> _warningToast(String text) async {
    return await Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14);
  }
}
