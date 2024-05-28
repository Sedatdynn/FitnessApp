import 'package:core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/cached_network_image/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

/// showing top of the exercise detail's page an image and title for the exercises
class CustomExerciseSliverAppBar extends StatelessWidget {
  const CustomExerciseSliverAppBar({required this.exercise, super.key});
  final Exercise? exercise;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.dynamicHeight(0.2),
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 4),
        title: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.mainPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Text(
              exercise?.categoryName.toString() ?? 'Exercise',
              style: context.textTheme.titleLarge,
            ),
          ),
        ),
        background: exercise?.imgUrl == null
            ? Assets.png.largeExrc.image(fit: BoxFit.cover)
            : CustomCachedNetworkImage(
                imageUrl: exercise!.imgUrl.toString(),
              ),
      ),
      leading: IconButton(
        onPressed: RouteManager.instance.pop,
        icon: const Icon(Icons.chevron_left_sharp),
        alignment: Alignment.topLeft,
        iconSize: 32,
      ),
    );
  }
}
