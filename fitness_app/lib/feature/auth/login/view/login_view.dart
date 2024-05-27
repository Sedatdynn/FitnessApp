import 'package:auto_route/auto_route.dart';
import 'package:core/navigator/auto_route_path.dart';
import 'package:core/navigator/manager/auto_route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/auth/login/login_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widget/login_widget.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key, this.canPop = true});
  final bool? canPop;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            await warningToast(state.errorMessage!);
            await Future<void>.delayed(const Duration(seconds: 1))
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
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              _SignInButton(formKey: formKey),
            ],
          ),
        ),
      ),
    );
  }
}
