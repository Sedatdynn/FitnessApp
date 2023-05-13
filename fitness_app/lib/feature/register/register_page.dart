import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import '../../product/const/const_shelf.dart';
import '../../core/service/auth_service.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../registerName/register_name.dart';
import '../views_shelf.dart';

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
  bool isLoading = false;
  final AuthService authService = AuthService();

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LogoBody(),
              const SizedBox(
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
              const SizedBox(
                height: 5,
              ),
              _orText(),
              const SizedBox(
                height: 30,
              ),
              CommonButton(
                  text: MyText.continueText, onPressed: _registerOnTap),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _usernameTextfield() {
    return TextField(
      style: context.subtitle1(context),
      textInputAction: TextInputAction.next,
      controller: _usernameController,
      cursorColor: context.textColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: context.mainColor,
        ),
        hintText: MyText.usernameText,
      ),
    );
  }

  TextField _emailTextfield() {
    return TextField(
      textInputAction: TextInputAction.next,
      style: context.subtitle1(context),
      controller: _emailController,
      cursorColor: context.textColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: context.mainColor,
        ),
        hintText: RegisterText.emailText,
      ),
    );
  }

  TextField _passwordTextfield() {
    return TextField(
      style: context.subtitle1(context),
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
      ),
    );
  }

  _orText() {
    return Padding(
      padding: context.minLeft,
      child: Text(
        RegisterText.orSignText,
        style: context.bdSmall(context)?.copyWith(color: context.textColor),
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
        isLoading = true;
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
      warningToast(context, WarningText.registerEmptyUsername);
    } else if (_emailController.text.toString().isEmpty) {
      warningToast(context, WarningText.registerEmptyEmail);
    } else if (_passwordController.text.toString().isEmpty) {
      warningToast(context, WarningText.registerInvalidPassword);
    } else if (_passwordController.text.length < 6) {
      warningToast(context, WarningText.registerInvalidPassword);
    } else {
      warningToast(context, WarningText.loginWrongEmailText);
    }
  }
}
