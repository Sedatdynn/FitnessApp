// ignore_for_file: prefer_const_constructors, avoid_init_to_null, use_build_context_synchronously

import 'package:fistness_app_firebase/core/const/const_shelf.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/service/foods_exercises_service.dart';
import 'package:fistness_app_firebase/views/home/viewModel/hp_view_mode.dart';
import 'package:fistness_app_firebase/views/service/project_network.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/foods_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late SharedPreferences prefs;
  late double lastSavedPoint = 0.0;
  @override
  void initState() {
    super.initState();
    definePref();
  }

  Future<void> definePref() async {
    prefs = await SharedPreferences.getInstance();
    lastSavedPoint = prefs.getDouble("point") ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        String item = "foods";
        return HomeViewModel(
          GeneralService(ProjectNetworkManager.instance.service, item),
        );
      },
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: context.mainColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text("Saved daily point is: $lastSavedPoint")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: context.height * 0.75,
                width: double.infinity,
                decoration: commonBoxDec(context.scfBackColor,
                    context.scfBackColor, context.scfBackColor),
                padding: context.minVertPadding,
                child: ListView(
                  children: [
                    _allFoodsTitles(
                        context, context.watch<HomeViewModel>().foods),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: context.height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Colors.purple,
                    ),
                    child: TextButton.icon(
                      onPressed: () async {
                        var lastPoint = prefs.getDouble("point") ?? 0.0;
                        await prefs.setDouble(
                            "point",
                            lastPoint +
                                context.read<HomeViewModel>().totalPoint);

                        var savedPoint = prefs.getDouble("point") ?? 0.0;
                        setState(() {
                          lastSavedPoint = savedPoint;
                        });
                      },
                      icon: Icon(Icons.save_alt_outlined,
                          color: context.textColor),
                      label: Text("Save Daily Point",
                          style: context.subtitle2(context)),
                    ),
                  ),
                  Container(
                    height: context.height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Colors.purple,
                    ),
                    child: TextButton.icon(
                      onPressed: () async {
                        await prefs.remove("point");

                        setState(() {
                          lastSavedPoint = 0.0;
                        });
                      },
                      icon: Icon(Icons.remove_circle_outline,
                          color: context.textColor),
                      label: Text("Reset Daily Point",
                          style: context.subtitle2(context)),
                    ),
                  ),
                ],
              ),
              _totalPointText(context),
            ],
          ),
        );
      },
    );
  }

  Container _allFoodsTitles(BuildContext context, List<Kategori> items) {
    return Container(
      padding: context.zeroAllPadding,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int i) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                margin: context.minTopBtm,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.purple,
                ),
                child: Text(
                  items[i].name.toString(),
                  style: context.headline6(context),
                  textAlign: TextAlign.center,
                ),
              ),
              _allFoodsInfos(context, items, i),
            ],
          );
        },
      ),
    );
  }

  Container _allFoodsInfos(BuildContext context, List<Kategori> items, int i) {
    return Container(
      padding: context.minHorzPadding,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items[i].icerik!.length,
        itemBuilder: (BuildContext ctx, int j) {
          return Card(
            color: context.scfBackColor,
            child: Row(children: [
              Text(
                items[i].icerik![j].isim.toString(),
                style: context.subtitle2(context),
              ),
              Expanded(child: Container()),
              Text(
                "${items[i].icerik![j].puan!.toDouble()} puan",
                style: context.subtitle2(context),
              ),
              _checkBox(items, i, j, context),
            ]),
          );
        },
      ),
    );
  }

  Checkbox _checkBox(List<Kategori> items, int i, int j, BuildContext context) {
    return Checkbox(
      hoverColor: Colors.pink,
      checkColor: context.textColor,
      activeColor: context.mainColor,
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

  _totalPointText(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Colors.purple,
      ),
      child: Text(
        "Current point is: ${context.watch<HomeViewModel>().totalPoint}",
        style: context.headline6(context),
      ),
    );
  }
}
