// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fistness_app_firebase/core/const/const_appbar.dart';
import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/product/service/dio_manager.dart';
import 'package:fistness_app_firebase/views/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/views/exercises/viewModel/exercises_view_model.dart';
import 'package:fistness_app_firebase/views/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/const/const_deco.dart';
import '../../service/foods_exercises_service.dart';

class DetailExercisesPage extends StatefulWidget {
  List<CategoryData> items;
  DetailExercisesPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DetailExercisesPage> createState() => _DetailExercisesPageState();
}

class _DetailExercisesPageState extends State<DetailExercisesPage>
    with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        String item = "exercises";
        return ExercisesViewModel(GeneralService(service, item));
      },
      builder: (context, child) {
        return Scaffold(
          appBar: const CommonAppBar(),
          body: Container(
            padding: context.minAllPadding,
            decoration: commonBoxDec(context.scfBackColor, context.scfBackColor,
                context.scfBackColor),
            child: ListView(children: [
              Container(
                decoration: commonBoxDec(context.scfBackColor,
                    context.scfBackColor, context.scfBackColor),
                child: ListView.builder(
                  itemCount: widget.items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctxt, int i) {
                    return Container(
                      margin: context.midAllPadding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.purple,
                      ),
                      child: Column(
                        children: [
                          Image.network(
                              widget.items[i].contentImage.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _movementInfo(
                                  context, i, "Type", widget.items[i].type),
                              _movementInfo(context, i, "Equipment",
                                  widget.items[i].equipment),
                              _movementInfo(context, i, "Mechanics",
                                  widget.items[i].mechanic),
                              _movementInfo(context, i, "Exp Level",
                                  widget.items[i].exerciseLevel),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  Container _movementInfo(BuildContext context, int i, String title, var info) {
    return Container(
      height: context.height * 0.07,
      decoration: BoxDecoration(
          color: context.greenColor,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(16.0))),
      padding: context.minsymVertHorzPadding,
      child: Column(
        children: [
          Text(
            title,
            style: context.subtitle1(context),
          ),
          Text(info.toString()),
        ],
      ),
    );
  }
}
