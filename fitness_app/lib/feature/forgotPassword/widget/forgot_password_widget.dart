part of '../view/forgot_password_view.dart';

class _ForgotPasswordTitle extends StatelessWidget {
  const _ForgotPasswordTitle();

  @override
  Widget build(BuildContext context) {
    return Text(QuestionsText.forgotPassText,
        style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.mainPrimary));
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText();

  @override
  Widget build(BuildContext context) {
    return Text(
      RegisterText.emailAssociated,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  final void Function(String)? onChanged;

  const _EmailTextFieldWidget({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      onChanged: onChanged,
      validator: (value) =>
          ValidateRegexExtension(value!).isEmail ? null : WarningText.registerUniqueMail,
      hintText: RegisterText.emailText,
      icon: Icons.mail,
    );
  }
}

class _ResetButton extends StatelessWidget {
  final String? email;
  const _ResetButton({required this.email});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
        text: RegisterText.resetPasswordText,
        onPressed: () async {
          if (email != null && email!.isNotEmpty) resetPassword();
        });
  }

  Future<void> resetPassword() async {
    final response = await AuthService.instance.resetPassword(email!);
    response.fold(
        (l) => warningToast(l.message),
        (r) =>
            warningToast('Reset password email has been sent successfully', color: AppColors.green)
                .then((value) => RouteManager.instance.pushNamed(path: RouteConstants.login)));
  }
}
