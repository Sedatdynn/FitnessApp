part of '../exercise_view.dart';

class _TopImageInfoWidget extends StatelessWidget {
  const _TopImageInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.png.largeExrc.image(),
        IconButton(
          onPressed: () => RouteManager.instance.pop(),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        Positioned(
          bottom: 10.h,
          left: 10.w,
          child: Text(
            'Exercises',
            style: context.textTheme.titleLarge?.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}

class _ExercisesBodyWidget extends StatelessWidget {
  const _ExercisesBodyWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExerciseCubit, ExerciseState, List<Exercise>?>(
      selector: (state) => state.exercises,
      builder: (context, exercises) {
        return SliverList.builder(
          itemCount: exercises?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: AppColors.darkText,
              child: ListTile(
                contentPadding: const AppPadding.minAll(),
                onTap: () => RouteManager.instance.push(
                  DetailExercisesRoute(
                    items: exercises[index],
                  ),
                ),
                leading: CustomCachedNetworkImage(
                  imageUrl: exercises![index].imgUrl!,
                  width: 92.w,
                ),
                title: Text(
                  exercises[index].categoryName.toString(),
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
      },
    );
  }
}
