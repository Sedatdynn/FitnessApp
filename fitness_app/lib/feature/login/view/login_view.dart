import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/feature/login/cubit/login_cubit.dart';
import 'package:fistness_app_firebase/feature/login/cubit/login_state.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/widget/textfield/auth_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({Key? key, this.canPop = true}) : super(key: key);
  final bool? canPop;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            warningToast(state.errorMessage!);
          }
          state.errorMessage;
        },
        child: Scaffold(
            appBar: canPop! ? const CommonAppBar() : null,
            body: SingleChildScrollView(
              child: Padding(
                padding: const AppPadding.lowHorizontal(),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const LogoBody(),
                      CustomSize.largeHeight(),
                      const _EmailTextFieldWidget(),
                      CustomSize.largeHeight(),
                      const _PasswordField(),
                      CustomSize.minHeight(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            RouteManager.instance.pushNamed(path: RouteConstants.forgotPassword);
                          },
                          child: const Text(
                            QuestionsText.forgotPassText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      CustomSize.xxLargeHeight(),
                      _SignInButton(formKey: formKey)
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
            style: Theme.of(context).textTheme.titleSmall,
            onChanged: (val) {
              if (val.isEmpty) return;
              context.read<LoginCubit>().setPassword(val);
            },
            obscureText: state.isVisible,
            cursorColor: AppColors.whiteText,
            validator: (value) => ValidateRegexExtension(value!).isPassword
                ? null
                : WarningText.registerInvalidPassword,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  context.read<LoginCubit>().changeVisible();
                },
                child: _CheckVisible(isVisible: state.isVisible),
              ),
              prefixIcon: const Icon(Icons.vpn_key, color: AppColors.mainPrimary),
              hintText: RegisterText.passwordText,
            ));
      },
    );
  }
}

class _CheckVisible extends StatelessWidget {
  const _CheckVisible({required this.isVisible});
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? const Icon(Icons.remove_red_eye, color: AppColors.mainPrimary)
        : const Icon(Icons.remove_red_eye_outlined, color: AppColors.mainPrimary);
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      onChanged: (val) {
        if (val.isEmpty) return;
        context.read<LoginCubit>().setEmail(val);
      },
      validator: (value) =>
          ValidateRegexExtension(value!).isEmail ? null : WarningText.registerUniqueMail,
      hintText: RegisterText.emailText,
      icon: Icons.mail,
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return CommonButton(
          text: MyText.continueText,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await context.read<LoginCubit>().signIn();
            } else {
              warningToast(RegisterText.fillErrorText);
            }
          });
    });
  }
}
