// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/service/foods_service.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/network/project_network.dart';
import '../../../../product/theme/colors.dart';
import '../../model/exercises_model.dart';
import '../../viewModel/exercises_view_model.dart';

@RoutePage()
class DetailExercisesView extends StatefulWidget {
  final List<CategoryData> items;
  final Exercise images;
  const DetailExercisesView({
    Key? key,
    required this.items,
    required this.images,
  }) : super(key: key);

  @override
  State<DetailExercisesView> createState() => _DetailExercisesViewState();
}

class _DetailExercisesViewState extends State<DetailExercisesView> {
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
          body: _listViewBody(context),
        );
      },
    );
  }

  ListView _listViewBody(BuildContext context) {
    return ListView(children: [
      Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.images.imgUrl.toString(),
              )),
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: () {
                RouteManager.instance.pop();
              },
              icon: const Icon(
                Icons.chevron_left_sharp,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: context.width * 0.03,
            child: Text(
              widget.images.categoryName.toString(),
              style:
                  Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.mainPrimary),
            ),
          )
        ],
      ),
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
        RouteManager.instance.push(DetailVideoRoute(items: widget.items[i].videoPageData!));
      },
      child: Container(
        margin: context.minAllPadding,
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
                decoration:
                    BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: _imageField(i),
                  title: _exercisesTitle(context, i),
                  subtitle: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10), topLeft: Radius.circular(10))),
                    child: Row(
                      children: [
                        _movementInfo(context, i, "Type", widget.items[i].type),
                        _movementInfo(context, i, "Equipment", widget.items[i].equipment),
                        _movementInfo(context, i, "Mechanics", widget.items[i].mechanic),
                        _movementInfo(context, i, "Exp Level", widget.items[i].exerciseLevel),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.play_circle_fill_rounded),
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
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  _movementInfo(BuildContext context, int i, String title, var info) {
    return Expanded(
      child: Padding(
        padding: const AppPadding.lowVertical(),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 8,
                    color: AppColors.backgroundColor,
                  ),
            ),
            Text(
              info.toString(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 6.0),
            ),
          ],
        ),
      ),
    );
  }
}
