// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:test_pro_project/screens/register_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              child: new Image.asset('assets/logo.png'),
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
                                builder: (context) => RegisterScreen()),
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
            SignInWithGoogle(),
            SizedBox(
              height: 15.0,
            ),
            Center(
                child: Text(
              "Continue without signing up",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ))
          ],
        ),
      ),
    );
  }
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  Future<String?> signInwithGoogle() async {
    print("dfsalıjfdsaljkdsafş");
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      print(credential);
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

class SignInWithGoogle extends StatefulWidget {
  SignInWithGoogle({Key? key}) : super(key: key);

  @override
  _SignInWithGoogleState createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isLoading
        ? Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.81,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    icon: Image.asset('assets/google.png'),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        FirebaseService service = new FirebaseService();
                        await service.signInwithGoogle();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    label: Text(
                      "Google",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                  OutlinedButton.icon(
                    icon: Image.asset('assets/facebook.png'),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    label: Text(
                      "Facebook",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                ],
              ),
            ),
          )
        : CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
