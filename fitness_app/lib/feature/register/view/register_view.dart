import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/register/cubit/register_cubit.dart';
import 'package:fistness_app_firebase/feature/register/cubit/register_state.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.lowHorizontal(),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  const LogoBody(),
                  SizedBox(height: 40.h),
                  _usernameTextfield(),
                  CustomSize.xLargeHeight(),
                  _emailTextfield(),
                  CustomSize.xLargeHeight(),
                  _passwordTextfield(),
                  CustomSize.minHeight(),
                  _orText(context),
                  SizedBox(height: 30.h),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return CommonButton(
                          text: MyText.continueText,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().registerUser();
                            } else {
                              warningToast('check warning messages');
                            }
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextfield() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          style: Theme.of(context).textTheme.titleSmall,
          textInputAction: TextInputAction.next,
          cursorColor: AppColors.whiteText,
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setUsername(val);
          },
          validator: (value) =>
              ValidateRegexExtension(value!).isName ? null : WarningText.registerEmptyUsername,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: AppColors.mainPrimary,
            ),
            hintText: MyText.usernameText,
          ),
        );
      },
    );
  }

  Widget _emailTextfield() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.next,
          style: Theme.of(context).textTheme.titleSmall,
          cursorColor: AppColors.whiteText,
          keyboardType: TextInputType.emailAddress,
          onChanged: (val) {
            if (val.isEmpty) return;
            context.read<RegisterCubit>().setEmail(val);
          },
          validator: (value) =>
              ValidateRegexExtension(value!).isEmail ? null : WarningText.registerUniqueMail,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: AppColors.mainPrimary,
            ),
            hintText: RegisterText.emailText,
          ),
        );
      },
    );
  }

  Widget _passwordTextfield() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          style: Theme.of(context).textTheme.titleSmall,
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
              onTap: () {
                context.read<RegisterCubit>().changeVisible();
              },
              child: state.isVisible
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
      },
    );
  }

  _orText(BuildContext context) {
    return Text(
      RegisterText.orSignText,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.whiteText),
    );
  }
}
