import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/product/global/theme_control.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_page.dart';
import 'package:fistness_app_firebase/views/bmi/future_bmi.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/const/const_shelf.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: MyText.authService.fetchCurrentUserDoc(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
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
                      child: Column(
                        children: [
                          Row(
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
                                    Icons.arrow_back_ios,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
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
                                        builder: (context) =>
                                            const LaunchPage(),
                                      )));
                                },
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data!["name"].toString(),
                                style: context.headline6(context),
                              )),
                          Container(
                            decoration: commonBoxDec(
                              const Color(0xFF0B0B0C),
                              const Color(0xFF19282F),
                              const Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: context.mainColor,
                                    tiles: [
                                      InkWell(
                                        onTap: () {
                                          MyText.authService.checkUid();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => View(),
                                              ));
                                        },
                                        child: ListTile(
                                          contentPadding:
                                              context.symVertPadding,
                                          leading: const Icon(
                                            Icons.my_location,
                                          ),
                                          title: const Text("Location"),
                                          subtitle: const Text("TR"),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.email,
                                        ),
                                        title: Text("Email"),
                                        subtitle: Text(
                                            snapshot.data!["email"].toString()),
                                      ),
                                      GestureDetector(
                                        onTap: () => context
                                            .read<ThemeNotifier>()
                                            .changeTheme(),
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.light_mode_outlined,
                                          ),
                                          title: Text("Theme Light"),
                                          subtitle: Text("Change theme mode"),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BmiCalculator(),
                                            )),
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.update,
                                          ),
                                          title: Text("BMI"),
                                          subtitle: Text("See bmi result"),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.logout,
                                          ),
                                          title: Text("Logout"),
                                          subtitle: Text("Have a good day"),
                                        ),
                                        onTap: () async {
                                          await deleteToken();
                                          MyText.authService.SignOut();
                                          Navigator.push(
                                              context,
                                              (MaterialPageRoute(
                                                builder: (context) =>
                                                    const LaunchPage(),
                                              )));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
