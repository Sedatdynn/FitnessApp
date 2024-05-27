import 'package:core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/auth/age/age_shelf.dart';
import 'package:fistness_app_firebase/product/navigator/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../widget/age_widget.dart';

@RoutePage()
class AgeView extends StatelessWidget {
  const AgeView({required this.params, super.key});
  final AgeParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgeCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.lowHorizontal(),
          child: _ScrollBodyWidget(params: params),
        ),
      ),
    );
  }
}

class _ScrollBodyWidget extends StatelessWidget {
  const _ScrollBodyWidget({
    required this.params,
  });

  final AgeParams params;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LogoBody(),
          CustomSize.xxLargeHeight(),
          const RegisterInfoQuestionText(text: LocaleKeys.Question_ageText),
          CustomSize.xxLargeHeight(),
          const _YearNumberPicker(),
          CustomSize.xxLargeHeight(),
          _NextButton(params: params),
        ],
      ),
    );
  }
}
