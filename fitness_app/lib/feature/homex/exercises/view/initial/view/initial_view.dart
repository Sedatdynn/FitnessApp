import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/enum/image/png/image_path.dart';
import 'package:flutter/material.dart';

part '../widget/initial_widget.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        ImagePath.diet_exrcs.toPng(),
        const Expanded(
          child: _GridBodyWidget(),
        ),
      ],
    )));
  }
}
