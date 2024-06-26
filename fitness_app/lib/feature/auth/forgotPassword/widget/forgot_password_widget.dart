part of '../view/forgot_password_view.dart';

class _ForgotPasswordTitle extends StatelessWidget {
  const _ForgotPasswordTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.Question_forgotPassText,
      style: Theme.of(context)
          .textTheme
          .displaySmall
          ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.mainPrimary),
    ).tr();
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.Auth_emailAssociated,
      textAlign: TextAlign.center,
      style: context.textTheme.titleSmall,
    ).tr();
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      onChanged: onChanged,
      validator: (value) => ValidateRegexExtension(value!).isEmail
          ? null
          : LocaleKeys.Warning_registerUniqueMail.tr(),
      hintText: LocaleKeys.Auth_emailText.tr(),
      icon: Icons.mail,
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({required this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      text: LocaleKeys.Auth_resetPasswordText.tr(),
      onPressed: () async {
        if (email != null && email!.isNotEmpty) await resetPassword();
      },
    );
  }

  Future<void> resetPassword() async {
    final response = await AuthService.instance!.resetPassword(email!);
    await response.fold(
      (l) => warningToast(l.message),
      (r) => warningToast('Reset password email has been sent successfully', color: AppColors.green)
          .then(
        (value) => RouteManager.instance.pushNamed(path: RouteConstants.login),
      ),
    );
  }
}
