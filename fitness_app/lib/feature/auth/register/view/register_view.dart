import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/auth/register/register_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widget/register_widget.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const LogoBody(),
                  const _UsernameTextfieldWidget(),
                  CustomSize.largeHeight(),
                  const _NameSurnameFieldWidget(),
                  CustomSize.largeHeight(),
                  const _EmailTextFieldWidget(),
                  CustomSize.largeHeight(),
                  const _PasswordTextFieldWidget(),
                  CustomSize.xLargeHeight(),
                  _ButtonWidget(formKey: formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
