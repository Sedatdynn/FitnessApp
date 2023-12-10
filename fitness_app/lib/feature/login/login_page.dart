import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:provider/provider.dart';

import '../../product/const/const_shelf.dart';
import '../../product/extensions/extensions_shelf.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../../product/widget/loading/app_loading.dart';
import '../views_shelf.dart';
import 'view_model/login_view_model.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.canPop = true}) : super(key: key);
  final bool? canPop;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: widget.canPop! ? const CommonAppBar() : null, body: _body(context));
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
              _bodyContainer(Provider.of<LoginViewModel>(context)),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        if (context.watch<LoginViewModel>().isLoading) const LoadingPage()
      ],
    );
  }

  Flexible _bodyContainer(LoginViewModel viewModel) {
    return Flexible(
        child: Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0))),
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
              _emailTextfield(Provider.of<LoginViewModel>(context)),
              const SizedBox(
                height: 20,
              ),
              _passwordTextfield(Provider.of<LoginViewModel>(context)),
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
                    context.read<LoginViewModel>().changeLoading();
                    bool? isSucces = await AuthService.instance.signInWithEmailAndPassword(
                        email: viewModel.emailController.text.trim().toString(),
                        password: viewModel.passwordController.text.trim());

                    if (isSucces) {
                      if (context.mounted) {
                        AutoRouter.of(context).pushNamed(RouteConstants.main);
                        context.read<LoginViewModel>().changeLoading();
                      }
                    } else {
                      if (context.mounted) {
                        warningToast(context, "Wrong Pass/Email! or verify your email!");
                        context.read<LoginViewModel>().changeLoading();
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _emailTextfield(LoginViewModel viewModel) {
    return TextField(
        style: Theme.of(context).textTheme.titleSmall,
        controller: viewModel.emailController,
        cursorColor: AppColors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: AppColors.mainPrimary,
          ),
          hintText: RegisterText.emailText,
        ));
  }

  TextField _passwordTextfield(LoginViewModel viewModel) {
    bool _isVisible = context.watch<LoginViewModel>().isVisible;
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: viewModel.passwordController,
      obscureText: _isVisible ? true : false,
      cursorColor: AppColors.whiteText,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            context.read<LoginViewModel>().changeVisibility();
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

  _forgotPassword() {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).pushNamed(RouteConstants.forgotPassword);
      },
      child: Text(
        QuestionsText.forgotPassText,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
