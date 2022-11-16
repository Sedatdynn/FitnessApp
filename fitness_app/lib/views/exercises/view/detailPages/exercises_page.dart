import 'package:fistness_app_firebase/core/const/const_appbar.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/views/exercises/view/detailPages/detail_exercises_page.dart';
import 'package:fistness_app_firebase/views/exercises/viewModel/exercises_view_model.dart';
import 'package:fistness_app_firebase/views/service/project_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/const/const_deco.dart';
import '../../../service/foods_exercises_service.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
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
            GeneralService(ProjectNetworkManager.instance.service, item));
      },
      builder: (context, child) {
        return Scaffold(
          appBar: const CommonAppBar(),
          body: Container(
            decoration: commonBoxDec(context.scfBackColor, context.scfBackColor,
                context.scfBackColor),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: context.minTopBtm,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.purple,
                  ),
                  child: Text(
                    "Exercises",
                    style: context.headline4(context),
                  ),
                ),
                _exercisesImages(
                    context, context.watch<ExercisesViewModel>().exercises),
              ],
            ),
          ),
        );
      },
    );
  }

  Container _exercisesImages(BuildContext context, List<Exercise> items) {
    return Container(
      decoration: commonBoxDec(
          context.scfBackColor, context.scfBackColor, context.scfBackColor),
      padding: context.symVertHorzPadding,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailExercisesPage(items: items[i].categoryData!),
                      ));
                },
                child: Container(
                  margin: context.minAllPadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.purple,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _imagePath(items, i),
                      _imagesTitle(items, i, context)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Image _imagePath(List<Exercise> items, int i) {
    return Image.network(
      items[i].imgUrl.toString(),
    );
  }

  Text _imagesTitle(List<Exercise> items, int i, BuildContext context) {
    return Text(items[i].categoryName.toString(),
        style:
            context.headline4(context)?.copyWith(color: context.scndTxtColor));
  }
}
