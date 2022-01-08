// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, curly_braces_in_flow_control_structures, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_project/screens/register_second.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  String email = "", password = "";
  bool isPasswordVisible = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final __emailController = TextEditingController();
  late TabController _tabController;
  Future signIn({String? email, String? password}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    __emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
        padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 5.0),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.red.shade900,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Sign up',
                  ),
                  Tab(
                    text: 'Sign in',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(child: buildEmail()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: signInEmailPass(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmail() => Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: "email",
                  hintText: 'name@example.com',
                  prefixIcon: Icon(Icons.account_circle),
                ),
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cant be empty";
                  } else if (!EmailValidator.validate(value)) {
                    return "Email is wrong";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _pass,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: isPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
                errorStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                labelText: "Create password",
                hintText: 'enter your password',
                prefixIcon: Icon(Icons.account_circle),
              ),
              obscureText: isPasswordVisible,
              onSaved: (value) {
                password = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password cant be empty";
                } else if (value.length < 6) {
                  return "Password must be at least 6 character";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: isPasswordVisible,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _confirmPass,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: isPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
                errorStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                labelText: "Re-write password",
                hintText: 'enter your password',
                prefixIcon: Icon(Icons.account_circle),
              ),
              onSaved: (value) {
                password = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password cant be empty";
                } else if (value != _pass.text)
                  return "Pasword Not Match";
                else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.81,
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
                  bool validate = _formKey.currentState!.validate();
                  if (validate) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Registration Successful",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))));
                    _addData();

                    _formKey.currentState!.reset();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red.shade900,
                        content: Text(
                          "Registration failed",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        )));
                  }
                },
                child: Text('Contiune'),
              ),
            )
          ],
        ),
      );
  Widget signInEmailPass() => Form(
      key: _formKey2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                labelText: "email",
                hintText: 'name@example.com',
                prefixIcon: Icon(Icons.account_circle),
              ),
              onSaved: (value) {
                email = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email cant be empty";
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: isPasswordVisible,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: isPasswordVisible
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () =>
                    setState(() => isPasswordVisible = !isPasswordVisible),
              ),
              errorStyle: TextStyle(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              labelText: "Enter your password",
              hintText: 'enter your password',
              prefixIcon: Icon(Icons.account_circle),
            ),
            onSaved: (value) {
              password = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cant be empty";
              } else {
                return null;
              }
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildForgotPasswordBtn(),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.81,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
              ),
              onPressed: () async {
                bool validate = _formKey2.currentState!.validate();
                dynamic data = await signIn(email: email, password: password);
                if (validate) {
                  _formKey2.currentState!.save();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Registration Successful",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0))));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterSecondScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red.shade900,
                      content: Text(
                        "Registration failed",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )));
                }
              },
              child: Text('Contiune'),
            ),
          ),
        ],
      ));

  Widget buildForgotPasswordBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return RegisterScreen();
            },
          ));
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  Future<void> _addData() async {
    Map<String, dynamic> users = Map();
    users["email"] = email;
    users["password"] = password;
    await firestore
        .collection("users")
        .add(users)
        .then((value) => debugPrint("Mail ve password eklendi"));
  }
}
