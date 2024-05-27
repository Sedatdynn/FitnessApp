import 'package:auto_route/auto_route.dart';
import 'package:core/navigator/manager/auto_route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/mobility_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/navigator/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/mobility_widget.dart';

@RoutePage()
class DailyMobilityView extends StatelessWidget {
  const DailyMobilityView({required this.params, super.key});
  final MobilityParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MobilityCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: _BodyWidget(params: params),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    required this.params,
  });

  final MobilityParams params;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.lowHorizontal(),
      child: Column(
        children: [
          const LogoBody(),
          const RegisterInfoQuestionText(text: LocaleKeys.Auth_selectMobility),
          CustomSize.xxLargeHeight(),
          const _DropDownWidget(),
          CustomSize.xxLargeHeight(),
          CustomSize.xxLargeHeight(),
          _NextButton(params: params),
        ],
      ),
    );
  }
}
