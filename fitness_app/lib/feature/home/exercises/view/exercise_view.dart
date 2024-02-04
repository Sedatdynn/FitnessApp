import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_cubit.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_state.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/enum/image/png/image_path.dart';
import 'package:fistness_app_firebase/product/global/cachedManager/cached_network_manager.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/circular_progress/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part './widget/exercise_subview.dart';

@RoutePage()
class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseCubit(),
      child: Scaffold(
        body: ListView(
          children: [
            const _TopImageInfoWidget(),
            BlocBuilder<ExerciseCubit, ExerciseState>(
              builder: (context, state) {
                return state.exercises == null
                    ? const LoadingCircularWidget()
                    : _ExercisesBodyWidget(state);
              },
            )
          ],
        ),
      ),
    );
  }
}
