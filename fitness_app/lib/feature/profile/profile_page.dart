import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/product/global/theme_control.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../product/const/const_deco.dart';
import '../../product/theme/colors.dart';
import '../bmi/bmi_page.dart';
import '../home/bottomNavigateBar/navigare_bar.dart';
import '../launch/launch_page.dart';
import '../views_shelf.dart';
import 'edit_profile.dart';

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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainPage(),
                                      ));
                                },
                              ),
                              Container(
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
                                  Icons.person,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data!["name"].toString(),
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
                                    color: AppColors.mainPrimary,
                                    tiles: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.email,
                                        ),
                                        title: const Text("Email"),
                                        subtitle: Text(snapshot.data!["email"].toString()),
                                      ),
                                      GestureDetector(
                                        onTap: () => context.read<ThemeNotifier>().changeTheme(),
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
                                              builder: (context) => BmiCalculator(),
                                            )),
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.leave_bags_at_home_outlined,
                                          ),
                                          title: Text("BMI"),
                                          subtitle: Text("See bmi result"),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: const ListTile(
                                          leading: Icon(
                                            Icons.update,
                                          ),
                                          title: Text("Update Profile"),
                                          subtitle: Text("Update your weight, height..."),
                                        ),
                                        onTap: () async {
                                          Navigator.push(
                                              context,
                                              (MaterialPageRoute(
                                                builder: (context) => const UpdateInfosView(),
                                              )));
                                        },
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
                                          MyText.authService.signOut();
                                          Navigator.push(
                                              context,
                                              (MaterialPageRoute(
                                                builder: (context) => const LaunchPage(),
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
