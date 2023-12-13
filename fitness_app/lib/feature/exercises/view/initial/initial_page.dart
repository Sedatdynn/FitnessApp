import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import 'package:flutter/material.dart';

import '../../../../product/enum/image/png/image_path.dart';
import '../../../views_shelf.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Stack(
          children: [
            ImagePath.diet_exrcs.toPng(),
            Positioned(
                bottom: 0,
                left: context.width / 25,
                child: Text(
                  "Welcome to\nDiet and Fitness App",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
              cardBody(
                  context, ImagePath.main_exercises.toPng(), "Exercises", RouteConstants.exercise),
              cardBody(context, ImagePath.diet_list.toPng(), "Diet List", RouteConstants.home),
            ],
          ),
        ),
      ],
    )));
  }

  InkWell cardBody(BuildContext context, Widget child, String cardTitle, String navigatePage) {
    return InkWell(
      onTap: () {
        RouteManager.instance.pushNamed(path: navigatePage);
      },
      child: Container(
          margin: context.minAllPadding,
          decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Expanded(
                child: child,
              ),
              Text(cardTitle, style: Theme.of(context).textTheme.titleLarge),
            ]),
          )),
    );
  }
}
