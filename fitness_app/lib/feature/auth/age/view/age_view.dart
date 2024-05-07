import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/auth/age/cubit/age_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/age/cubit/age_state.dart';
import 'package:fistness_app_firebase/feature/auth/age/params/age_params.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/params/mobility_params.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/register_info_text.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:fistness_app_firebase/product/widget/logo/logo.dart';
import 'package:fistness_app_firebase/product/widget/numberPicker/number_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../widget/age_widget.dart';

@RoutePage()
class AgeView extends StatelessWidget {
  final AgeParams params;
  const AgeView({Key? key, required this.params}) : super(key: key);

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
          RegisterInfoQuestionText(text: LocaleKeys.Question_ageText.tr()),
          CustomSize.xxLargeHeight(),
          const _YearNumberPicker(),
          CustomSize.xxLargeHeight(),
          _NextButton(params: params),
        ],
      ),
    );
  }
}
