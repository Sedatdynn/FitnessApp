import 'package:fistness_app_firebase/feature/service/foods_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/network/project_network.dart';
import '../../../../product/const/const_deco.dart';
import '../../../../product/extensions/extensions_shelf.dart';
import '../../model/exercises_model.dart';
import '../../viewModel/exercises_view_model.dart';
import 'detail_exercises_page.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
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
        return ExercisesViewModel(
            FoodsService(ProjectNetworkManager.instance.service, item));
      },
      builder: (context, child) {
        return Scaffold(
          body: ListView(
            children: [
              topImgField(context),
              listTileBody(
                  context, context.watch<ExercisesViewModel>().exercises),
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        Positioned(
            bottom: 10,
            left: context.width * 0.03,
            child: Text(
              "Exercises",
              style: context.headline4(context),
            ))
      ],
    );
  }

  Image topImg() {
    return Image.asset("assets/$topImgPath.jpg");
  }

  Container listTileBody(BuildContext context, List<Exercise> items) {
    return Container(
      decoration: commonBoxDec(
          context.scfBackColor, context.scfBackColor, context.scfBackColor),
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
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailExercisesPage(
                            items: items[i].categoryData!,
                            images: items[i],
                          ),
                        ));
                  },
                  leading: _listTileLeading(context, items, i),
                  title: _listTileTitle(items, i, context),
                  subtitle: _listTileSubT(items, i, context),
                  trailing: const Icon(Icons.chevron_right_outlined),
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
      style: context
          .bdSmall(context)
          ?.copyWith(fontSize: 14, color: context.textColor),
    );
  }

  Text _listTileTitle(List<Exercise> items, int i, BuildContext context) {
    return Text(
      items[i].categoryName.toString(),
      style: context.subtitle2(context)?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Container _listTileLeading(
      BuildContext context, List<Exercise> items, int i) {
    return Container(
        decoration: BoxDecoration(
          color: context.greenColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: _listTileImg(items, i));
  }

  ClipRRect _listTileImg(List<Exercise> items, int i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        items[i].imgUrl.toString(),
      ),
    );
  }
}
