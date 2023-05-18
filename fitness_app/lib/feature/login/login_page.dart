import '../../product/const/const_shelf.dart';
import '../../product/extensions/extensions_shelf.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../../product/widget/loading/app_loading.dart';
import '../forgotPassword/forgot_password.dart';
import '../home/bottomNavigateBar/navigare_bar.dart';
import '../views_shelf.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
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
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ));
                      }
                    } else {
                      if (context.mounted) {
                        warningToast(
                            context, "Wrong Pass/Email! or verify your email!");
                      }
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
        style: Theme.of(context).textTheme.titleSmall,
        controller: _emailController,
        cursorColor: AppColors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: AppColors.mainPrimary,
          ),
          hintText: RegisterText.emailText,
        ));
  }

  TextField _passwordTextfield() {
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: _passwordController,
      obscureText: _isVisible ? true : false,
      cursorColor: AppColors.whiteText,
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
              ? const Icon(
                  Icons.remove_red_eye,
                  color: AppColors.mainPrimary,
                )
              : const Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.mainPrimary,
                ),
        ),
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: AppColors.mainPrimary,
        ),
        hintText: RegisterText.passwordText,
        hintStyle: Theme.of(context).textTheme.titleSmall,
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
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
