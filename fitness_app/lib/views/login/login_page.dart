import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

import '../../core/const/const_shelf.dart';

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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.minLargeLtrb,
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
        if (isLoading) const LoadingPage()
      ],
    );
  }

  Flexible _bodyContainer() {
    return Flexible(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Padding(
        padding: context.largeAllPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const LogoBody(),
              const SizedBox(
                height: 50,
              ),
              _emailTextfield(),
              const SizedBox(
                height: 20,
              ),
              _passwordTextfield(),
              const SizedBox(
                height: 5,
              ),
              _forgotPassword(),
              const SizedBox(
                height: 40,
              ),
              CommonButton(
                  text: MyText.contiuneText, onPressed: _logInWithEmail),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _emailTextfield() {
    return TextField(
      style: TextStyle(color: context.textColor),
      controller: _emailController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: context.mainColor,
          ),
          hintText: RegisterText.emailText,
          hintStyle: TextStyle(color: context.textColor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.shadeGreyColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.mainColor),
              borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField _passwordTextfield() {
    return TextField(
      style: TextStyle(color: context.textColor),
      controller: _passwordController,
      obscureText: _isVisible ? true : false,
      cursorColor: context.textColor,
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
                  color: context.mainColor,
                )
              : Icon(
                  Icons.remove_red_eye_outlined,
                  color: context.mainColor,
                ),
        ),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: context.mainColor,
        ),
        hintText: RegisterText.passwordText,
        hintStyle: TextStyle(color: context.textColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.shadeGreyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.mainColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _logInWithEmail() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await MyText.authService
          .signInWithEmail(_emailController.text, _passwordController.text)
          .then((value) async {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }).catchError((error) async {
        if (error.toString().contains('invalid-email')) {
          await _warningToast(WarningText.loginWrongEmailText);
        } else if (error.toString().contains('user-not-found')) {
          await _warningToast(WarningText.loginNoAccountText);
        } else if (error.toString().contains('wrong-password')) {
          await _warningToast(WarningText.loginWrongPasswordText);
        } else {
          await _warningToast(WarningText.errorText);
        }
      }).whenComplete(() async {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      _warningToast(WarningText.errorText);
    }
  }

  Future<bool?> _warningToast(String text) async {
    return await Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: context.greenColor,
        textColor: context.textColor,
        fontSize: 14);
  }

  _forgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
        );
      },
      child: Text(
        QuestionsText.forgotPassText,
        style: TextStyle(color: context.textColor, fontSize: 16.0),
      ),
    );
  }
}
