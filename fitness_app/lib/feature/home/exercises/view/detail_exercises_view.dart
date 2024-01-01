import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/exercises_model.dart';

@RoutePage()
class DetailExercisesView extends StatelessWidget {
  final Exercise items;
  const DetailExercisesView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        _TopImageInfoWidget(items: items),
        ListView.builder(
          itemCount: items.categoryData!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: AppColors.darkText,
                child: Row(
                  children: [
                    CustomSize.minWidth(),
                    Expanded(
                      flex: 2,
                      child: Image.network(items.categoryData![index].contentImage.toString()),
                    ),
                    CustomSize.normalWidth(),
                    Expanded(flex: 4, child: _ExerciseInfoList(items: items, index: index)),
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.play_circle_fill_rounded,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ));
          },
        )
      ]),
    );
  }
}

class _TopImageInfoWidget extends StatelessWidget {
  final Exercise items;

  const _TopImageInfoWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(items.imgUrl.toString()),
        Positioned(
          left: 0,
          child: IconButton(
            onPressed: () => RouteManager.instance.pop(),
            icon: const Icon(Icons.chevron_left_sharp),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10.w,
          child: Container(
            padding: const AppPadding.minAll(),
            decoration: BoxDecoration(
                color: AppColors.mainPrimary, borderRadius: BorderRadius.circular(12)),
            child: Text(
              items.categoryName.toString(),
              style: context.textTheme.titleLarge?.copyWith(color: AppColors.backgroundColor),
            ),
          ),
        )
      ],
    );
  }
}

class _ExerciseInfoList extends StatelessWidget {
  final Exercise items;
  final int index;

  const _ExerciseInfoList({required this.items, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(items.categoryData![index].exerciseName.toString(),
            style: context.textTheme.titleSmall?.copyWith(color: AppColors.mainPrimary)),
        CustomSize.minHeight(),
        _RowValues(title: "Equipment: ", subtitle: items.categoryData![index].equipment.toString()),
        _RowValues(
            title: "Exp Level: ", subtitle: items.categoryData![index].exerciseLevel.toString())
      ],
    );
  }
}

class _RowValues extends StatelessWidget {
  final String title;
  final String subtitle;
  const _RowValues({required this.title, required this.subtitle});
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
