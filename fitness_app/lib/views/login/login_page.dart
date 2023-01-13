// ignore_for_file: use_build_context_synchronously

import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/home/bottomNavigateBar/navigare_bar.dart';
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
                  text: MyText.continueText,
                  onPressed: () async {
                    bool? isSucces = await MyText.authService
                        .signInWithEmailandPassword(
                            _emailController.text.trim().toString(),
                            _passwordController.text.trim());

                    if (isSucces) {
                      MyText.authService.checkUid();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ));
                    } else {
                      warningToast(
                          context, "Wrong Pass/Email! or verify your email!");
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _emailTextfield() {
    return TextField(
        style: context.subtitle1(context),
        controller: _emailController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: context.mainColor,
          ),
          hintText: RegisterText.emailText,
        ));
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
        hintStyle: context.subtitle1(context),
      ),
    );
  }

  // Future _logInWithEmail() async {
  //   if (_emailController.text.isNotEmpty &&
  //       _passwordController.text.isNotEmpty) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     try {
  //       MyText.currentUser = await MyText.authService.auth
  //           .signInWithEmailAndPassword(
  //               email: _emailController.text.trim(),
  //               password: _passwordController.text.trim());

  //       if (MyText.currentUser != null) {
  //         setState(() {
  //           isLoading = false;
  //         });

  //         Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (context) => const HomePage()),
  //             (route) => false);
  //       } else {
  //         setState(() {
  //           isLoading = false;
  //         });
  //       }
  //     } catch (error) {
  //       setState(() {
  //         isLoading = false;
  //       });

  //       if (error.toString().contains('invalid-email')) {
  //         await warningToast(context, WarningText.loginWrongEmailText);
  //       } else if (error.toString().contains('user-not-found')) {
  //         await warningToast(context, WarningText.loginNoAccountText);
  //       } else if (error.toString().contains('wrong-password')) {
  //         await warningToast(context, WarningText.loginWrongPasswordText);
  //       } else {
  //         await warningToast(context, WarningText.errorText);
  //       }
  //     }
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });

  //     warningToast(context, WarningText.errorText);
  //   }
  // }

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
        style: context.subtitle2(context),
      ),
    );
  }
}
