import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/register/cubit/register_cubit.dart';
import 'package:fistness_app_firebase/feature/register/cubit/register_state.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/extensions/regex.dart';
import 'package:fistness_app_firebase/product/widget/textfield/auth_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';
part '../widget/register_widget.dart';

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
                  CustomSize.largeHeight(),
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
