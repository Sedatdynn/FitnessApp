part of '../view/register_view.dart';

class _UsernameTextfieldWidget extends StatelessWidget {
  const _UsernameTextfieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return AuthTextField(
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setUsername(val);
          },
          validator: (value) =>
              ValidateRegexExtension(value!).isUsername ? null : WarningText.registerEmptyUsername,
          hintText: MyText.usernameText,
          icon: Icons.account_circle,
        );
      },
    );
  }
}

class _NameSurnameFieldWidget extends StatelessWidget {
  const _NameSurnameFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return AuthTextField(
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setNameSurname(val);
          },
          validator: (value) =>
              ValidateRegexExtension(value!).isNameSurname ? null : WarningText.nameWarningText,
          hintText: QuestionsText.nameText,
          icon: Icons.mark_unread_chat_alt_sharp,
        );
      },
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return AuthTextField(
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setEmail(val);
          },
          validator: (value) =>
              ValidateRegexExtension(value!).isEmail ? null : WarningText.registerUniqueMail,
          hintText: RegisterText.emailText,
          icon: Icons.mail,
        );
      },
    );
  }
}

class _PasswordTextFieldWidget extends StatelessWidget {
  const _PasswordTextFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          style: context.textTheme.titleSmall,
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setPassword(val);
          },
          obscureText: state.isVisible,
          cursorColor: AppColors.whiteText,
          validator: (value) => ValidateRegexExtension(value!).isPassword
              ? null
              : WarningText.registerInvalidPassword,
          decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () => context.read<RegisterCubit>().changeVisible(),
                  child: _CheckVisible(isVisible: state.isVisible)),
              prefixIcon: const Icon(Icons.vpn_key, color: AppColors.mainPrimary),
              hintText: RegisterText.passwordText,
              hintStyle: context.textTheme.bodyLarge),
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
        text: MyText.continueText,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<RegisterCubit>().registerUser();
          } else {
            warningToast(RegisterText.fillErrorText);
          }
        });
  }
}
