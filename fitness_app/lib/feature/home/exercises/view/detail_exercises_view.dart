import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/global/cachedManager/cached_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/exercises_model.dart';
part 'widget/detail_exercise_subview.dart';

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
            return InkWell(
              onTap: () => RouteManager.instance
                  .push(DetailVideoRoute(items: items.categoryData![index].videoPageData!)),
              child: _DetailBodyCard(items: items, index: index),
            );
          },
        )
      ]),
    );
  }
}
