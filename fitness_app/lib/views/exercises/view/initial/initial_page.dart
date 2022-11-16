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
                  )),
            ),
          ),
          body: ListView(
            children: [
              bodyContainer(context, exrcTitle, exrcsImg.toString(),
                  const ExercisesPage()),
              bodyContainer(
                  context, dietTitle, dietImg.toString(), const HomeView())
            ],
          )),
    );
  }

  InkWell bodyContainer(
      BuildContext context, String title, String imgPath, page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ));
      },
      child: Container(
        margin: context.midAllPadding,
        padding: context.largeAllPadding,
        height: context.height * 0.4,
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.purple,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.green,
              ),
              child: Text(title, style: context.headline4(context)),
            ),
            Image.asset(
              "assets/$imgPath.png",
              height: context.height * 0.25,
            )
          ],
        ),
      ),
    );
  }
}
