import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/auth/age/params/age_params.dart';
import 'package:fistness_app_firebase/feature/auth/age/view/age_view.dart';
import 'package:fistness_app_firebase/feature/auth/forgotPassword/view/forgot_password_view.dart';
import 'package:fistness_app_firebase/feature/auth/gender/params/gender_params.dart';
import 'package:fistness_app_firebase/feature/auth/gender/view/gender_view.dart';
import 'package:fistness_app_firebase/feature/auth/height/params/height_params.dart';
import 'package:fistness_app_firebase/feature/auth/height/view/height_view.dart';
import 'package:fistness_app_firebase/feature/auth/login/view/login_view.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/params/mobility_params.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/view/mobility_view.dart';
import 'package:fistness_app_firebase/feature/auth/register/view/register_view.dart';
import 'package:fistness_app_firebase/feature/auth/weight/params/weight_params.dart';
import 'package:fistness_app_firebase/feature/auth/weight/view/weight_view.dart';
import 'package:fistness_app_firebase/feature/homex/bmi/bmi_page.dart';
import 'package:fistness_app_firebase/feature/homex/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/feature/homex/exercises/view/detailPages/detail_exercises_page.dart';
import 'package:fistness_app_firebase/feature/homex/exercises/view/detailPages/exercises_page.dart';
import 'package:fistness_app_firebase/feature/homex/exercises/view/detailVideoPages/detail_video_page.dart';
import 'package:fistness_app_firebase/feature/homex/home/bottomNavigateBar/navigate_bar.dart';
import 'package:fistness_app_firebase/feature/homex/home/view/home_page.dart';
import 'package:fistness_app_firebase/feature/homex/profile/edit_profile.dart';
import 'package:fistness_app_firebase/feature/homex/profile/profile_page.dart';
import 'package:fistness_app_firebase/feature/welcome/launch/view/launch_view.dart';

import 'package:flutter/material.dart';

import 'auto_route_path.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: RouteConstants.initial, page: LaunchRoute.page),
        AutoRoute(path: RouteConstants.main, page: MainRoute.page),
        AutoRoute(path: RouteConstants.register, page: RegisterRoute.page),
        AutoRoute(path: RouteConstants.login, page: LoginRoute.page),
        AutoRoute(path: RouteConstants.forgotPassword, page: ForgotPasswordRoute.page),
        AutoRoute(path: RouteConstants.gender, page: GenderRoute.page),
        AutoRoute(path: RouteConstants.age, page: AgeRoute.page),
        AutoRoute(path: RouteConstants.dailyMobility, page: DailyMobilityRoute.page),
        AutoRoute(path: RouteConstants.height, page: HeightRoute.page),
        AutoRoute(path: RouteConstants.weight, page: WeightRoute.page),
        AutoRoute(path: RouteConstants.home, page: HomeRoute.page),
        AutoRoute(path: RouteConstants.exercise, page: ExercisesRoute.page),
        AutoRoute(path: RouteConstants.detailExercise, page: DetailExercisesRoute.page),
        AutoRoute(path: RouteConstants.detailVideo, page: DetailVideoRoute.page),
        AutoRoute(path: RouteConstants.bmiCalculator, page: BmiCalculatorRoute.page),
        AutoRoute(path: RouteConstants.profile, page: ProfileRoute.page),
        AutoRoute(path: RouteConstants.updateUserInfo, page: UpdateInfosRoute.page),
      ];
}
