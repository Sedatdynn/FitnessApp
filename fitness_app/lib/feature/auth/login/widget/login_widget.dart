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
      validator: (value) => ValidateRegexExtension(value!).isEmail
          ? null
          : LocaleKeys.Warning_registerUniqueMail.tr(),
      hintText: LocaleKeys.Auth_emailText.tr(),
      icon: Icons.mail,
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) => state.isVisible,
      builder: (context, isVisible) {
        return TextFormField(
            style: context.textTheme.titleSmall,
            onChanged: (val) {
              if (val.isEmpty) return;
              context.read<LoginCubit>().setPassword(val);
            },
            obscureText: isVisible,
            cursorColor: AppColors.whiteText,
            validator: (value) => ValidateRegexExtension(value!).isPassword
                ? null
                : LocaleKeys.Warning_registerInvalidPassword.tr(),
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () => context.read<LoginCubit>().changeVisible(),
                child: _CheckVisible(isVisible: isVisible),
              ),
              prefixIcon: const Icon(Icons.vpn_key, color: AppColors.mainPrimary),
              hintText: LocaleKeys.Auth_passwordText.tr(),
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
        onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.forgotPassword),
        child: const Text(
          LocaleKeys.Question_forgotPassText,
          style: TextStyle(color: Colors.white),
        ).tr(),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
        text: LocaleKeys.continueText,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await context.read<LoginCubit>().signIn();
          } else {
            warningToast(LocaleKeys.Auth_fillErrorText.tr());
          }
        });
  }
}
