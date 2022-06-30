// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
        ),
        if (_isLoading) const LoadingPage()
      ],
    );
  }

  Flexible _bodyContainer() {
    return Flexible(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _logoBody(),
              SizedBox(
                height: 50,
              ),
              _emailTextfield(),
              const SizedBox(
                height: 20,
              ),
              _passwordTextfield(),
              SizedBox(
                height: 5,
              ),
              _forgotPassword(),
              SizedBox(
                height: 40,
              ),
              _myButton(),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _emailTextfield() {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: _emailController,
      cursorColor: Colors.black,
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

  _logoBody() {
    String image_path = "assets/logo.png";
    return Container(
      height: 200,
      child: Image.asset(image_path),
      alignment: Alignment.center,
    );
  }

  _myButton() {
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
          onPressed: _logInWithEmail,
          child: Text(myText.contiuneText,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    );
  }

  _logInWithEmail() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      await myText.authService
          .signInWithEmail(_emailController.text, _passwordController.text)
          .then((value) async {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }).catchError((error) async {
        if (error.toString().contains('invalid-email')) {
          await _warningToast(warningText.loginWrongEmailText);
        } else if (error.toString().contains('user-not-found')) {
          await _warningToast(warningText.loginNoAccountText);
        } else if (error.toString().contains('wrong-password')) {
          await _warningToast(warningText.loginWrongPasswordText);
        } else {
          await _warningToast(warningText.errorText);
        }
      }).whenComplete(() async {
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      _warningToast(warningText.errorText);
    }
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

  _forgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        );
      },
      child: Text(
        questionsText.forgotPassText,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}
