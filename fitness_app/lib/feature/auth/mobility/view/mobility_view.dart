import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/auth/height/params/height_params.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/cubit/mobility_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/cubit/mobility_state.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/params/mobility_params.dart';

import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/const/text/texts.dart';
import 'package:fistness_app_firebase/product/global/service/global_service.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/mobility_widget.dart';

@RoutePage()
class DailyMobilityView extends StatelessWidget {
  final MobilityParams params;
  const DailyMobilityView({Key? key, required this.params}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MobilityCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
            padding: const AppPadding.lowHorizontal(),
            child: Column(
              children: [
                const LogoBody(),
                const RegisterInfoQuestionText(text: RegisterText.selectMobility),
                CustomSize.xxLargeHeight(),
                const _DropDownWidget(),
                CustomSize.xxLargeHeight(),
                CustomSize.xxLargeHeight(),
                _NextButton(params: params),
              ],
            )),
      ),
    );
  }
}
