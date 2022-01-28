// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:fistness_app_firebase/services/auth_service.dart';
import 'package:fistness_app_firebase/views/registerName/register_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fistness_app_firebase/src/texts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isVisible = true;
  bool _isLoading = false;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bodyContainer(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }

  Flexible _bodyContainer() {
    return Flexible(
        child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _logoBody(),
              SizedBox(
                height: 50,
              ),
              _usernameTextfield(),
              const SizedBox(
                height: 20,
              ),
              _emailTextfield(),
              const SizedBox(
                height: 20,
              ),
              _passwordTextfield(),
              SizedBox(
                height: 40,
              ),
              myButton(),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _usernameTextfield() {
    return TextField(
      controller: _usernameController,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.red.shade900,
          ),
          hintText: 'User name',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900),
              borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField _emailTextfield() {
    return TextField(
      controller: _emailController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.red.shade900,
          ),
          hintText: 'Email',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900),
              borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField _passwordTextfield() {
    return TextField(
      controller: _passwordController,
      obscureText: _isVisible ? true : false,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            if (_isVisible) {
              setState(() {
                _isVisible = false;
              });
            } else {
              setState(() {
                _isVisible = false;
              });
              _isVisible = true;
            }
          },
          child: _isVisible
              ? Icon(
                  Icons.remove_red_eye,
                  color: Colors.red.shade900,
                )
              : Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.red.shade900,
                ),
        ),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.red.shade900,
        ),
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade900,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
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

  void _registerOnTap() {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterNamePage(
                    username: _usernameController.text,
                    mail: _emailController.text,
                    password: _passwordController.text,
                  )));
    } else {
      _warningToast("Eksik bilgi mevcut");
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
}
