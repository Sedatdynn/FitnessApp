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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    ? const Center(child: CircularProgressIndicator())
                    : _ExercisesBodyWidget(state);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _TopImageInfoWidget extends StatelessWidget {
  const _TopImageInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImagePath.largeExrc.toPng(),
        IconButton(
          onPressed: () => RouteManager.instance.pop(),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        Positioned(
            bottom: 10.h,
            left: 10.w,
            child: Text(
              "Exercises",
              style: context.textTheme.titleLarge?.copyWith(color: AppColors.white),
            ))
      ],
    );
  }
}

class _ExercisesBodyWidget extends StatelessWidget {
  final ExerciseState state;
  const _ExercisesBodyWidget(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.exercises?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: AppColors.darkText,
          child: ListTile(
            contentPadding: const AppPadding.minAll(),
            onTap: () => RouteManager.instance.push(DetailExercisesRoute(
              items: state.exercises![index],
            )),
            leading: CachedNetworkManager.instance!.cachedNetworkImage(
              imageUrl: state.exercises![index].imgUrl!,
              width: 92.w,
            ),
            title: Text(
              state.exercises![index].categoryName.toString(),
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.mainPrimary),
            ),
            trailing: const Icon(
              Icons.chevron_right_outlined,
              color: AppColors.mainPrimary,
            ),
          ),
        );
      },
    );
  }
}
