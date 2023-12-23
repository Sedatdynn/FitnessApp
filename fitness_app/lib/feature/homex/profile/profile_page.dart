import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_deco.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/global/theme_control.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Future deleteToken() async {
    await CacheManager.instance.removeValue(CacheKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: AuthService.instance.fetchCurrentUserDoc(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const AppPadding.minAll(),
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
                                  RouteManager.instance.pushNamed(path: RouteConstants.main);
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
                                        onTap: () => RouteManager.instance
                                            .pushNamed(path: RouteConstants.bmiCalculator),
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
                                          RouteManager.instance
                                              .pushNamed(path: RouteConstants.updateUserInfo);
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
                                          AuthService.instance.signOut();
                                          RouteManager.instance
                                              .pushNamed(path: RouteConstants.initial);
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
