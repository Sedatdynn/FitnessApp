part of '../exercise_view.dart';

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
