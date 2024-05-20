import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/core_shelf.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_cubit.dart';
import 'package:fistness_app_firebase/feature/home/exercises/cubit/exercise_state.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/feature/home/exercises/shimmer/exercise_shimmer.dart';
import 'package:fistness_app_firebase/feature/home/exercises/view/widget/custom_sliver_app_bar.dart';
import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/global/cachedManager/cached_network_manager.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
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
        body: CustomScrollView(
          slivers: [
            const CustomExerciseSliverAppBar(exercise: null),
            const SliverPadding(padding: AppPadding.lowVertical()),
            BlocSelector<ExerciseCubit, ExerciseState, bool>(
              selector: (state) => state.exercises != null,
              builder: (context, state) {
                return state
                    ? const _ExercisesBodyWidget()
                    : const SliverToBoxAdapter(child: ExerciseViewShimmer());
              },
            ),
          ],
        ),
      ),
    );
  }
}
