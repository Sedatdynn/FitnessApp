import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/feature/login/cubit/login_cubit.dart';
import 'package:fistness_app_firebase/feature/login/cubit/login_state.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/widget/textfield/auth_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';
part '../widget/login_widget.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({Key? key, this.canPop = true}) : super(key: key);
  final bool? canPop;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            warningToast(state.errorMessage!);
            Future.delayed(const Duration(seconds: 1))
                .then((value) => context.read<LoginCubit>().clearErrorMessage());
          }
        },
        listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
        child: _ScaffoldBody(formKey),
      ),
    );
  }

  Scaffold _ScaffoldBody(GlobalKey<FormState> formKey) {
    return Scaffold(
        appBar: canPop! ? const CommonAppBar() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const AppPadding.lowHorizontal(),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const LogoBody(),
                  CustomSize.largeHeight(),
                  const _EmailTextFieldWidget(),
                  CustomSize.largeHeight(),
                  const _PasswordField(),
                  CustomSize.minHeight(),
                  const _ForgotPasswordText(),
                  CustomSize.xxLargeHeight(),
                  _SignInButton(formKey: formKey)
                ],
              ),
            ),
          ),
        ));
  }
}
