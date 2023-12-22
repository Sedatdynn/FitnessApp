import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:fistness_app_firebase/product/widget/textfield/auth_textfield.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import '../../product/const/const_shelf.dart';
import '../../product/theme/colors.dart';
import '../views_shelf.dart';

@RoutePage()
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const AppPadding.normalHorizontal(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoBody(),
              Text(QuestionsText.forgotPassText,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.mainPrimary)),
              CustomSize.normalHeight(),
              Text(
                RegisterText.emailAssociated,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              CustomSize.xxLargeHeight(),
              _emailTextfield(),
              CustomSize.xxLargeHeight(),
              CustomSize.xxLargeHeight(),
              CommonButton(
                  text: RegisterText.resetPasswordText,
                  onPressed: () {
                    // final response = await FoodsService(
                    //         ProjectNetworkManager.instance.service, "reset password")
                    //     .resetPasswordLink(_emailController.text);
                    // if (response!) {
                    //   await warningToast("Reset password email has been sent",
                    //       color: AppColors.green);
                    // } else {
                    //   await warningToast(
                    //     "Reset password email couldnt sent please try again ",
                    //   );
                    // }
                  })
            ],
          ),
        ),
      ),
    );
  }

  _emailTextfield() {
    return AuthTextField(
      onChanged: (val) {
        if (val.isEmpty) return;
        // context.read<LoginCubit>().setEmail(val);
      },
      validator: (value) =>
          ValidateRegexExtension(value!).isEmail ? null : WarningText.registerUniqueMail,
      hintText: RegisterText.emailText,
      icon: Icons.mail,
    );
  }
}
