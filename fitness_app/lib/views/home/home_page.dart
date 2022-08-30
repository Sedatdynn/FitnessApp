import 'package:fistness_app_firebase/core/const/const_shelf.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_page.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:provider/provider.dart';

import '../../product/global/theme_control.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const String imageUrl =
        "https://image.shutterstock.com/image-vector/vector-illustration-bodybuilder-muscular-arm-260nw-1464554840.jpg";

    return Scaffold(
      body: Container(
        padding: context.minMidAllPadding,
        decoration: commonBoxDec(
          context.watch<ThemeNotifier>().isLight
              ? Colors.grey
              : const Color(0xFF19282F),
          context.watch<ThemeNotifier>().isLight
              ? Colors.white
              : const Color(0xFF3d444e),
          context.watch<ThemeNotifier>().isLight
              ? Colors.white
              : const Color(0xFF2c2f37),
        ),
        child: FutureBuilder(
            future: MyText.authService.fetchCurrentUserDoc(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState != ConnectionState.waiting) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      Container(
                        padding: context.midVerticalPadding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: commonBoxDec(
                                  context.watch<ThemeNotifier>().isLight
                                      ? Colors.grey
                                      : const Color(0xFF19282F),
                                  context.watch<ThemeNotifier>().isLight
                                      ? Colors.grey
                                      : const Color(0xFF19282F),
                                  context.watch<ThemeNotifier>().isLight
                                      ? Colors.grey
                                      : const Color(0xFF000000),
                                ),
                                child: const Icon(
                                  Icons.receipt_outlined,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                      builder: (context) => const LaunchPage(),
                                    )));
                              },
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: commonBoxDec(
                                  context.watch<ThemeNotifier>().isLight
                                      ? Colors.grey
                                      : const Color(0xFF19282F),
                                  context.watch<ThemeNotifier>().isLight
                                      ? Colors.grey
                                      : const Color(0xFF19282F),
                                  context.watch<ThemeNotifier>().isLight
                                      ? Colors.grey
                                      : const Color(0xFF000000),
                                ),
                                child: const Icon(
                                  Icons.account_box,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    )));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: context.midAllPadding,
                          height: context.height / 3.5,
                          width: context.width,
                          decoration: commonBoxDec(
                            context.watch<ThemeNotifier>().isLight
                                ? Colors.grey
                                : const Color(0xFF19282F),
                            context.watch<ThemeNotifier>().isLight
                                ? Colors.grey
                                : const Color(0xFF2a2d32),
                            context.watch<ThemeNotifier>().isLight
                                ? Colors.grey
                                : const Color(0xFF4b4f5b),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: context.largeLtrb,
                                child: Text(
                                  MyText.homeWelcomeText +
                                      snapshot.data["username"],
                                  style: context.headline6(context),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Hero(
                                          tag: 0,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(imageUrl,
                                                fit: BoxFit.cover,
                                                height: 70.0,
                                                width: 70.0),
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("25",
                                          style: context.subtitle1(context)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("Normal",
                                          style: context.subtitle1(context)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Kg: 85",
                                          style: context.subtitle1(context)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text("Age: 22",
                                          style: context.subtitle1(context)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text("Tall: 193",
                                          style: context.subtitle1(context)),
                                    ],
                                  )
                                ],
                              ),
                              Expanded(child: Container()),
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  Container(
                                    padding: context.riBottom,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(1, 2),
                                          blurRadius: 10,
                                          color: Color.fromARGB(
                                              255, 166, 203, 220),
                                        )
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.settings,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, i) {
                                    String imagePath = "assets/exercise.png";
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    (MaterialPageRoute(
                                                        builder: (context) =>
                                                            BmiCalculater(
                                                              userHeight:
                                                                  snapshot.data[
                                                                      "length"],
                                                              userWeight:
                                                                  snapshot.data[
                                                                      "weight"],
                                                            ))));
                                              },
                                              child: Container(
                                                margin: context
                                                    .midLargeVerticalPadding,
                                                height: 200,
                                                width: context.width / 2.4,
                                                decoration: commonBoxDec(
                                                  context
                                                          .watch<
                                                              ThemeNotifier>()
                                                          .isLight
                                                      ? Colors.grey
                                                      : const Color(0xFF2a2d32),
                                                  context
                                                          .watch<
                                                              ThemeNotifier>()
                                                          .isLight
                                                      ? Colors.grey
                                                      : const Color(0xFF4b4f5b),
                                                  context
                                                          .watch<
                                                              ThemeNotifier>()
                                                          .isLight
                                                      ? Colors.grey
                                                      : const Color(0xFF19282F),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50)),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              imagePath),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        MyText.exerciseText,
                                                        style: context
                                                            .subtitle1(context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: context
                                                  .midLargeVerticalPadding,
                                              height: 200,
                                              width: context.width / 2.4,
                                              decoration: commonBoxDec(
                                                context
                                                        .watch<ThemeNotifier>()
                                                        .isLight
                                                    ? Colors.grey
                                                    : const Color(0xFF2a2d32),
                                                context
                                                        .watch<ThemeNotifier>()
                                                        .isLight
                                                    ? Colors.grey
                                                    : const Color(0xFF4b4f5b),
                                                context
                                                        .watch<ThemeNotifier>()
                                                        .isLight
                                                    ? Colors.grey
                                                    : const Color(0xFF19282F),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      50)),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            imagePath),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      MyText.exerciseText,
                                                      style: context
                                                          .subtitle1(context),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  }))
                        ],
                      )
                    ],
                  );
                } else {
                  return const Center(child: Text("data yok"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: context.textColor,
        selectedItemColor: context.scndTxtColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: MyText.bnFirstText,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search,
            ),
            label: MyText.bnSecondText,
            backgroundColor: context.mainColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_circle,
            ),
            label: MyText.bnThirdText,
          ),
        ],
      ),
    );
  }
}
