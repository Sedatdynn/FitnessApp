// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/home/viewModel/home_page_model.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: context.scfBackColor,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: foods.length,
          itemBuilder: (BuildContext ctxt, int i) {
            return Column(
              children: [
                Card(
                  child: Text(
                    foods[i].name.toString(),
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  color: context.greenColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: foods[i].icerik!.length,
                    itemBuilder: (BuildContext ctx, int j) {
                      return Card(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                foods[i].icerik![j].isim.toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                foods[i].icerik![j].puan.toString() + " puan",
                                style: TextStyle(fontSize: 20),
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                //  fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              )
                            ]),
                      ); // display username as an example
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
