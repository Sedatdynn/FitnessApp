part of '../view/login_view.dart';

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

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
            style: context.textTheme.titleSmall,
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

class _ForgotPasswordText extends StatelessWidget {
  const _ForgotPasswordText();

  @override
  Widget build(BuildContext context) {
    return Align(
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
