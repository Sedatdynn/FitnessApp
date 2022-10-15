// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/product/service/dio_manager.dart';
import 'package:fistness_app_firebase/views/home/service/foods_service.dart';
import 'package:fistness_app_firebase/views/home/viewModel/hp_view_mode.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:provider/provider.dart';
import '../model/foods_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(FoodService(service)),
      builder: (context, child) {
        return Scaffold(
          //appBar: AppBar(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _foodsListView(context, context.watch<HomeViewModel>().foods),
                _totalPointText(context),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView _foodsListView(BuildContext context, List<Kategori> items) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext ctxt, int i) {
        return Column(
          children: [
            Card(
              child: Text(
                items[i].name.toString(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              width: 500,
              height: 300,
              color: context.greenColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items[i].icerik!.length,
                itemBuilder: (BuildContext ctx, int j) {
                  return Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[i].icerik![j].isim.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${items[i].icerik![j].puan!.toDouble()} puan",
                            style: TextStyle(fontSize: 16),
                          ),
                          _checkBox(items, i, j, context),
                        ]),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Checkbox _checkBox(List<Kategori> items, int i, int j, BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      //  fillColor: MaterialStateProperty.resolveWith(getColor),
      value: items[i].icerik![j].kontrol,

      onChanged: (value) {
        setState(() {
          items[i].icerik![j].kontrol = value!;
          if (items[i].icerik![j].kontrol!) {
            context.read<HomeViewModel>().totalPoint +=
                items[i].icerik![j].puan!;
          } else {
            context.read<HomeViewModel>().totalPoint -=
                items[i].icerik![j].puan!;
          }
        });
      },
    );
  }

  Text _totalPointText(BuildContext context) {
    return Text(
      context.watch<HomeViewModel>().totalPoint.toString(),
      style: TextStyle(fontSize: 35, color: Colors.blue),
    );
  }
}
