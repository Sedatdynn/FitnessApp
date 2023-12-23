import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:fistness_app_firebase/product/widget/textfield/auth_textfield.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../views_shelf.dart';

part '../widget/forgot_password_widget.dart';

@RoutePage()
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
              _EmailTextFieldWidget(onChanged: (val) {
                if (val.isEmpty) return;
                setState(() => email = val);
              }),
              CustomSize.xxLargeHeight(),
              CustomSize.xxLargeHeight(),
              _ResetButton(email: email)
            ],
          ),
        ),
      ),
    );
  }
}
