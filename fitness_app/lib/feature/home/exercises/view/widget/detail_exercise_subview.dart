part of '../detail_exercises_view.dart';

class _DetailBodyCard extends StatelessWidget {
  const _DetailBodyCard({required this.items, required this.index});
  final Exercise items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkText,
      child: Row(
        children: [
          CustomSize.minWidth(),
          Expanded(
            flex: 2,
            child: CustomCachedNetworkImage(
              imageUrl: items.categoryData![index].contentImage.toString(),
            ),
          ),
          CustomSize.normalWidth(),
          Expanded(flex: 4, child: _ExerciseInfoList(items: items, index: index)),
          const Expanded(
            child: Icon(
              Icons.play_circle_fill_rounded,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExerciseInfoList extends StatelessWidget {
  const _ExerciseInfoList({required this.items, required this.index});
  final Exercise items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          items.categoryData![index].exerciseName.toString(),
          style: context.textTheme.titleSmall?.copyWith(color: AppColors.mainPrimary),
        ),
        CustomSize.minHeight(),
        _RowValues(title: 'Equipment: ', subtitle: items.categoryData![index].equipment.toString()),
        _RowValues(
          title: 'Exp Level: ',
          subtitle: items.categoryData![index].exerciseLevel.toString(),
        ),
      ],
    );
  }
}

class _RowValues extends StatelessWidget {
  const _RowValues({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(),
        ),
        CustomSize.minWidth(),
        Text(
          subtitle,
          style: context.textTheme.bodyLarge?.copyWith(color: AppColors.mainPrimary),
        ),
      ],
    );
  }
}
