// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fistness_app_firebase/core/const/const_appbar.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/views/exercises/view/detailVideoPages/detail_video_page.dart';
import 'package:fistness_app_firebase/views/exercises/viewModel/exercises_view_model.dart';
import 'package:fistness_app_firebase/views/service/project_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/const/const_deco.dart';
import '../../../service/foods_exercises_service.dart';

class DetailExercisesPage extends StatefulWidget {
  List<CategoryData> items;
  DetailExercisesPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DetailExercisesPage> createState() => _DetailExercisesPageState();
}

class _DetailExercisesPageState extends State<DetailExercisesPage> {
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
          body: _listViewBody(context),
        );
      },
    );
  }

  ListView _listViewBody(BuildContext context) {
    return ListView(children: [
      ListView.builder(
        itemCount: widget.items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctxt, int i) {
          return _navigateToPage(context, i);
        },
      )
    ]);
  }

  InkWell _navigateToPage(BuildContext context, int i) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailVideoPage(items: widget.items[i].videoPageData!),
            ));
      },
      child: Container(
        margin: context.midAllPadding,
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(16.0),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: _imageField(i),
                  title: _exercisesTitle(context, i),
                  subtitle: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: Row(
                      children: [
                        _movementInfo(context, i, "Type", widget.items[i].type),
                        _movementInfo(
                            context, i, "Equipment", widget.items[i].equipment),
                        _movementInfo(
                            context, i, "Mechanics", widget.items[i].mechanic),
                        _movementInfo(context, i, "Exp Level",
                            widget.items[i].exerciseLevel),
                      ],
                    ),
                  ),
                  trailing: Icon(Icons.play_circle_fill_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _imageField(int i) => ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(widget.items[i].contentImage.toString()));

  _exercisesTitle(BuildContext context, int i) {
    return Text(
      widget.items[i].exerciseName.toString(),
      style: context.subtitle1(context),
    );
  }

  _movementInfo(BuildContext context, int i, String title, var info) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: context.subtitle1(context)?.copyWith(
                  fontSize: 8,
                  color: context.scfBackColor,
                ),
          ),
          Text(
            info.toString(),
            style: context.subtitle1(context)?.copyWith(fontSize: 6.0),
          ),
        ],
      ),
    );
  }
}
