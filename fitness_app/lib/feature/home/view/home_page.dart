// ignore_for_file: prefer_const_constructors, avoid_init_to_null, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/service/foods_service.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';

import 'package:provider/provider.dart';

import '../../../core/init/network/project_network.dart';
import '../../../product/theme/colors.dart';
import '../../views_shelf.dart';
import '../model/foods_model.dart';
import '../viewModel/hp_view_mode.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double lastSavedPoint = 0.0;

  @override
  void initState() {
    super.initState();
    definePref();
  }

  Future<void> definePref() async {
    lastSavedPoint = CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        String item = "foods";
        return HomeViewModel(
          FoodsService(ProjectNetworkManager.instance.service, item),
        );
      },
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: AppColors.mainPrimary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text("Saved daily point is: $lastSavedPoint")),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: context.height * 0.1,
                      child: FutureBuilder(
                          future: AuthService.instance.fetchCurrentUserDoc(),
                          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState != ConnectionState.waiting) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: context.height * 0.1,
                                      decoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius: BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                "Initial point depends on your information: ",
                                                style: Theme.of(context).textTheme.titleSmall),
                                          ),
                                          Expanded(
                                            child: Text(
                                              snapshot.data?["userRightPoint"].toString() ??
                                                  "no dataa",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                    Container(
                      height: context.height * 0.70,
                      width: double.infinity,
                      decoration: commonBoxDec(AppColors.backgroundColor, AppColors.backgroundColor,
                          AppColors.backgroundColor),
                      child: ListView(
                        children: [
                          _allFoodsTitles(context, context.watch<HomeViewModel>().foods),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: context.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Colors.purple,
                          ),
                          child: TextButton.icon(
                            onPressed: () async {
                              var lastPoint =
                                  CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0;
                              await CacheManager.instance.setDoubleValue(CacheKeys.point,
                                  lastPoint + context.read<HomeViewModel>().totalPoint);

                              var savedPoint =
                                  CacheManager.instance.getDoubleValue(CacheKeys.point.name) ?? 0.0;
                              setState(() {
                                lastSavedPoint = savedPoint;
                              });
                            },
                            icon: Icon(Icons.save_alt_outlined, color: AppColors.whiteText),
                            label: Text("Save Daily Point",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ),
                        Container(
                          height: context.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Colors.purple,
                          ),
                          child: TextButton.icon(
                            onPressed: () async {
                              await CacheManager.instance.removeValue(CacheKeys.point);
                              setState(() {
                                lastSavedPoint = 0.0;
                              });
                            },
                            icon: Icon(Icons.remove_circle_outline, color: AppColors.whiteText),
                            label: Text("Reset Daily Point",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    _totalPointText(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SizedBox _allFoodsTitles(BuildContext context, List<Kategori> items) {
    return SizedBox(
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
                  style: Theme.of(context).textTheme.titleLarge,
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
      padding: AppPadding.lowHorizontal(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items[i].icerik!.length,
        itemBuilder: (BuildContext ctx, int j) {
          return Card(
            color: AppColors.backgroundColor,
            child: Row(children: [
              Text(
                items[i].icerik![j].isim.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(child: Container()),
              Text(
                "${items[i].icerik![j].puan!.toDouble()} point",
                style: Theme.of(context).textTheme.titleSmall,
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
      checkColor: AppColors.whiteText,
      activeColor: AppColors.mainPrimary,
      value: items[i].icerik![j].kontrol,
      onChanged: (value) {
        setState(() {
          items[i].icerik![j] = items[i].icerik![j].copyWith(kontrol: value!);
          if (items[i].icerik![j].kontrol!) {
            context.read<HomeViewModel>().totalPoint += items[i].icerik![j].puan!;
          } else {
            context.read<HomeViewModel>().totalPoint -= items[i].icerik![j].puan!;
          }
        });
      },
    );
  }

  _totalPointText(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Colors.purple,
      ),
      child: Text(
        "Current point is: ${context.watch<HomeViewModel>().totalPoint}",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
