import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import '../../product/const/const_shelf.dart';
import '../../core/service/auth_service.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../views_shelf.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isVisible = true;
  bool isLoading = false;
  final AuthService authService = AuthService.instance;

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
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0))),
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
              CommonButton(text: MyText.continueText, onPressed: _registerOnTap),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _usernameTextfield() {
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      textInputAction: TextInputAction.next,
      controller: _usernameController,
      cursorColor: AppColors.whiteText,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: AppColors.mainPrimary,
        ),
        hintText: MyText.usernameText,
      ),
    );
  }

  TextField _emailTextfield() {
    return TextField(
      textInputAction: TextInputAction.next,
      style: Theme.of(context).textTheme.titleSmall,
      controller: _emailController,
      cursorColor: AppColors.whiteText,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: AppColors.mainPrimary,
        ),
        hintText: RegisterText.emailText,
      ),
    );
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
      ),
    );
  }

  _orText() {
    return Padding(
      padding: context.minLeft,
      child: Text(
        RegisterText.orSignText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.whiteText),
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
      RouteManager.instance.push(RegisterNameRoute(
        username: _usernameController.text,
        mail: _emailController.text,
        password: _passwordController.text,
      ));
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
