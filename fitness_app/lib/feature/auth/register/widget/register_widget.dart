part of '../view/register_view.dart';

class _UsernameTextfieldWidget extends StatelessWidget {
  const _UsernameTextfieldWidget();

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      onChanged: (val) {
        if (val.isEmpty) return;
        context.read<RegisterCubit>().setUsername(val);
      },
      validator: (value) => ValidateRegexExtension(value!).isUsername
          ? null
          : LocaleKeys.Warning_registerEmptyUsername.tr(),
      hintText: LocaleKeys.usernameText.tr(),
      icon: Icons.account_circle,
    );
  }
}

class _NameSurnameFieldWidget extends StatelessWidget {
  const _NameSurnameFieldWidget();

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      onChanged: (val) {
        if (val.isEmpty) return;
        context.read<RegisterCubit>().setNameSurname(val);
      },
      validator: (value) => ValidateRegexExtension(value!).isNameSurname
          ? null
          : LocaleKeys.Warning_nameWarningText.tr(),
      hintText: LocaleKeys.Question_nameText.tr(),
      icon: Icons.mark_unread_chat_alt_sharp,
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      onChanged: (val) {
        if (val.isEmpty) return;
        context.read<RegisterCubit>().setEmail(val);
      },
      validator: (value) => ValidateRegexExtension(value!).isEmail
          ? null
          : LocaleKeys.Warning_registerUniqueMail.tr(),
      hintText: LocaleKeys.Auth_emailText.tr(),
      icon: Icons.mail,
    );
  }
}

class _PasswordTextFieldWidget extends StatelessWidget {
  const _PasswordTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterCubit, RegisterState, bool>(
      selector: (state) => state.isVisible,
      builder: (context, visibility) {
        return TextFormField(
          style: context.textTheme.titleSmall,
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setPassword(val);
          },
          obscureText: visibility,
          cursorColor: AppColors.whiteText,
          validator: (value) => ValidateRegexExtension(value!).isPassword
              ? null
              : LocaleKeys.Warning_registerInvalidPassword.tr(),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => context.read<RegisterCubit>().changeVisible(),
              child: _CheckVisible(isVisible: visibility),
            ),
            prefixIcon: const Icon(Icons.vpn_key, color: AppColors.mainPrimary),
            hintText: LocaleKeys.Auth_passwordText.tr(),
            hintStyle: context.textTheme.bodyLarge,
          ),
        );
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

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      text: LocaleKeys.continueText.tr(),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<RegisterCubit>().registerUser();
        } else {
          warningToast(LocaleKeys.Auth_fillErrorText.tr());
        }
      },
    );
  }
}
