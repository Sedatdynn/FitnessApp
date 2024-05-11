import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/core_shelf.dart';
import 'package:fistness_app_firebase/feature/home/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/global/global_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/detail_exercise_subview.dart';

@RoutePage()
class DetailExercisesView extends StatelessWidget {
  const DetailExercisesView({required this.items, super.key});
  final Exercise items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _TopImageInfoWidget(items: items),
          ListView.builder(
            itemCount: items.categoryData!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => RouteManager.instance
                    .push(DetailVideoRoute(items: items.categoryData![index].videoPageData!)),
                child: _DetailBodyCard(items: items, index: index),
              );
            },
          ),
        ],
      ),
    );
  }
}
