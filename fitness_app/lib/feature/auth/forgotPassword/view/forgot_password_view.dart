import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';
import 'package:fistness_app_firebase/product/widget/widgets_shelf.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widget/forgot_password_widget.dart';

@RoutePage()
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String? email = '';
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
              const _ForgotPasswordTitle(),
              CustomSize.normalHeight(),
              const _InfoText(),
              CustomSize.xxLargeHeight(),
              _EmailTextFieldWidget(
                onChanged: (val) {
                  if (val.isEmpty) return;
                  setState(() => email = val);
                },
              ),
              CustomSize.xxLargeHeight(),
              CustomSize.xxLargeHeight(),
              _ResetButton(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
