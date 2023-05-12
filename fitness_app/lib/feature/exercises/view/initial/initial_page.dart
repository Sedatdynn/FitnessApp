import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import 'package:flutter/material.dart';

import '../../../home/view/home_page.dart';
import '../../../views_shelf.dart';
import '../detailPages/exercises_page.dart';

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
            body: Column(
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/diet_exrcs.png",
              height: context.height * 0.3,
            ),
            Positioned(
                bottom: 0,
                left: context.width / 25,
                child: Text(
                  "Welcome to\nDiet and Fitness App",
                  style: context.headline4(context)?.copyWith(
                    shadows: <Shadow>[
                      const Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 187, 175, 175),
                      ),
                      const Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(124, 190, 13, 134),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              cardBody(context, exrcsImg, exrcTitle, const ExercisesPage()),
              cardBody(context, dietImg, dietTitle, const HomeView()),
            ],
          ),
        ),
      ],
    )));
  }

  InkWell cardBody(BuildContext context, String imgPath, String cardTitle,
      dynamic navigatePage) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => navigatePage,
            ));
      },
      child: Container(
          margin: context.minAllPadding,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      "assets/$imgPath.png",
                    ),
                  ),
                  Text(
                    cardTitle,
                    style: context.headline6(context),
                  ),
                ]),
          )),
    );
  }
}
