import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/service/foods_service.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/network/project_network.dart';
import '../../../../product/const/const_deco.dart';
import '../../../../product/extensions/extensions_shelf.dart';
import '../../model/exercises_model.dart';
import '../../viewModel/exercises_view_model.dart';

@RoutePage()
class ExercisesView extends StatefulWidget {
  const ExercisesView({super.key});

  @override
  State<ExercisesView> createState() => _ExercisesViewState();
}

class _ExercisesViewState extends State<ExercisesView> {
  String topImgPath = 'largeExrc';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        String item = "exercises";
        return ExercisesViewModel(FoodsService(ProjectNetworkManager.instance.service, item));
      },
      builder: (context, child) {
        return Scaffold(
          body: ListView(
            children: [
              topImgField(context),
              listTileBody(context, context.watch<ExercisesViewModel>().exercises),
            ],
          ),
        );
      },
    );
  }

  Stack topImgField(BuildContext context) {
    return Stack(
      children: [
        topImg(),
        IconButton(
          onPressed: () {
            RouteManager.instance.pop();
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        Positioned(
            bottom: 10,
            left: context.width * 0.03,
            child: Text(
              "Exercises",
              style: Theme.of(context).textTheme.displaySmall,
            ))
      ],
    );
  }

  Image topImg() {
    return Image.asset("assets/png/$topImgPath.jpg");
  }

  Container listTileBody(BuildContext context, List<Exercise> items) {
    return Container(
      decoration: commonBoxDec(
          AppColors.backgroundColor, AppColors.backgroundColor, AppColors.backgroundColor),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: context.minAllPadding,
                decoration:
                    BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    onTap: () {
                      RouteManager.instance.push(DetailExercisesRoute(
                        items: items[i].categoryData!,
                        images: items[i],
                      ));
                    },
                    // leading: _listTileLeading(context, items, i),
                    title: _listTileTitle(items, i, context),
                    subtitle: _listTileSubT(items, i, context),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Text _listTileSubT(List<Exercise> items, int i, BuildContext context) {
    return Text(
      "See ${items[i].categoryName.toString()} workouts",
      style:
          Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14, color: AppColors.whiteText),
    );
  }

  Text _listTileTitle(List<Exercise> items, int i, BuildContext context) {
    return Text(
      items[i].categoryName.toString(),
      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
