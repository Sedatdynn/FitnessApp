import 'package:auto_route/auto_route.dart';
import 'package:core/navigator/manager/auto_route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/auth/gender/gender_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/navigator/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/gender_widget.dart';

@RoutePage()
class GenderView extends StatelessWidget {
  const GenderView({required this.params, super.key});
  final GenderParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.lowHorizontal(),
          child: _BodyScrollWidget(params: params),
        ),
      ),
    );
  }
}

class _BodyScrollWidget extends StatelessWidget {
  const _BodyScrollWidget({
    required this.params,
  });

  final GenderParams params;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const LogoBody(),
            CustomSize.minHeight(),
            const RegisterInfoQuestionText(text: LocaleKeys.Question_sexText),
            CustomSize.xLargeHeight(),
            const _ToggleGenderButtons(),
            CustomSize.xxLargeHeight(),
            _NextButton(params: params),
          ],
        ),
      ),
    );
  }
}
