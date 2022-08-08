// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:fistness_app_firebase/const/const_appbar.dart';
import 'package:fistness_app_firebase/const/const_button.dart';
import 'package:fistness_app_firebase/const/const_logo_body.dart';
import 'package:fistness_app_firebase/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

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
      appBar: CommonAppBar(),
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.minMidLtrb,
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
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Padding(
        padding: context.midLtrb,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoBody(),
              SizedBox(
                height: 40,
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
                height: 5,
              ),
              _orText(),
              SizedBox(
                height: 30,
              ),
              CommonButton(
                  text: myText.contiuneText, onPressed: _registerOnTap),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _usernameTextfield() {
    return TextField(
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.next,
      controller: _usernameController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.red.shade900,
          ),
          hintText: myText.usernameText,
          hintStyle: TextStyle(color: Colors.white),
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
      textInputAction: TextInputAction.next,
      style: TextStyle(color: Colors.white),
      controller: _emailController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.red.shade900,
          ),
          hintText: registerText.emailText,
          hintStyle: TextStyle(color: Colors.white),
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
      style: TextStyle(color: Colors.white),
      controller: _passwordController,
      obscureText: _isVisible ? true : false,
      cursorColor: Colors.white,
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
        hintText: registerText.passwordText,
        hintStyle: TextStyle(color: Colors.white),
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

  _orText() {
    return Padding(
      padding: context.minLeft,
      child: Text(
        registerText.orSignText,
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
    );
  }

  void _registerOnTap() {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _emailController.text.contains("@") &&
        _emailController.text.contains(".com") &&
        _passwordController.text.isNotEmpty &&
        _passwordController.text.length >= 6) {
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
    } else if (_usernameController.text.isEmpty) {
      _warningToast(warningText.registerEmptyUsername);
    } else if (_emailController.text.toString().isEmpty) {
      _warningToast(warningText.registerEmptyEmail);
    } else if (_passwordController.text.toString().isEmpty) {
      _warningToast(warningText.registerUnvalidPassword);
    } else if (_passwordController.text.length < 6) {
      _warningToast(warningText.registerUnvalidPassword);
    } else {
      _warningToast(warningText.loginWrongEmailText);
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
