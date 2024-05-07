import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/auth/age/params/age_params.dart';
import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_state.dart';
import 'package:fistness_app_firebase/feature/auth/gender/params/gender_params.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/register_info_text.dart';

import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:fistness_app_firebase/product/widget/logo/logo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/gender_widget.dart';

@RoutePage()
class GenderView extends StatelessWidget {
  final GenderParams params;
  const GenderView({Key? key, required this.params}) : super(key: key);

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
            _NextButton(params: params)
          ],
        ),
      ),
    );
  }
}
