import 'package:fistness_app_firebase/core/const/const_appbar.dart';
import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/exercises/view/detailPages/exercises_page.dart';
import 'package:flutter/material.dart';

import '../../../home/view/home_page.dart';
import '../../../views_shelf.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String exrcTitle = "Exercises";
  String exrcsImg = "main_exercises";
  String dietTitle = "Diet List";
  String dietImg = "diet_list";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            width: context.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.greenColor,
            ),
            child: const Text(
              "Welcome to\n Diet and Fitness App",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: ListView(children: [
        listTileContainer(context, exrcsImg, exrcTitle, "See all exercises",
            const ExercisesPage()),
        listTileContainer(context, dietImg, dietTitle,
            "See diet list and create your point", const HomeView()),
      ]),
    ));
  }

  Container listTileContainer(BuildContext context, String imgPath,
      String title, String subTitle, dynamic navigatePage) {
    return Container(
      margin: context.minAllPadding,
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return navigatePage;
          }));
        },
        leading: Container(
          width: 80,
          decoration: BoxDecoration(
            color: context.greenColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            "assets/$imgPath.png",
          ),
        ),
        title: Text(
          title,
          style:
              context.subtitle2(context)?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subTitle,
          style: context
              .bdSmall(context)
              ?.copyWith(fontSize: 14, color: context.textColor),
        ),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
}
