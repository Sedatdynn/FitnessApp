import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/feature/auth/login/cubit/login_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/login/cubit/login_state.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';

import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:fistness_app_firebase/product/widget/logo/logo.dart';
import 'package:fistness_app_firebase/product/widget/textfield/auth_textfield.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: Scaffold(
          appBar: canPop! ? const CommonAppBar() : null,
          body: _BodyScrollWidget(formKey: formKey),
        ),
      ),
    );
  }
}

class _BodyScrollWidget extends StatelessWidget {
  const _BodyScrollWidget({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const AppPadding.lowHorizontal(),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomSize.xxLargeHeight(),
              const LogoBody(),
              CustomSize.xxLargeHeight(),
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
    );
  }
}
