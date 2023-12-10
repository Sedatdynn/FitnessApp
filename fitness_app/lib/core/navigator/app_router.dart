import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/age/age_page.dart';
import 'package:fistness_app_firebase/feature/exerciseMobility/exercise_mobility.dart';
import 'package:fistness_app_firebase/feature/forgotPassword/forgot_password.dart';
import 'package:fistness_app_firebase/feature/gender/gender.dart';
import 'package:fistness_app_firebase/feature/height/height_page.dart';
import 'package:fistness_app_firebase/feature/home/bottomNavigateBar/navigare_bar.dart';
import 'package:fistness_app_firebase/feature/launch/view/launch_page.dart';
import 'package:fistness_app_firebase/feature/login/login_page.dart';
import 'package:fistness_app_firebase/feature/register/register_page.dart';
import 'package:fistness_app_firebase/feature/registerName/register_name.dart';
import 'package:fistness_app_firebase/feature/weight/weight_page.dart';
import 'package:flutter/material.dart';

import 'auto_route_path.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: RouteConstants.initial, page: LaunchRoute.page),
        AutoRoute(path: RouteConstants.main, page: MainRoute.page),
        AutoRoute(path: RouteConstants.register, page: RegisterRoute.page),
        AutoRoute(path: RouteConstants.login, page: LoginRoute.page),
        AutoRoute(path: RouteConstants.forgotPassword, page: ForgotPasswordRoute.page),
        AutoRoute(path: RouteConstants.registerName, page: RegisterNameRoute.page),
        AutoRoute(path: RouteConstants.gender, page: GenderRoute.page),
        AutoRoute(path: RouteConstants.age, page: AgeRoute.page),
        AutoRoute(path: RouteConstants.dailyMobility, page: DailyMobilityRoute.page),
        AutoRoute(path: RouteConstants.height, page: HeightRoute.page),
        AutoRoute(path: RouteConstants.weight, page: WeightRoute.page),
      ];
}
