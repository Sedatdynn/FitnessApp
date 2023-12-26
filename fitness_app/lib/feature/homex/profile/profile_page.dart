import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_deco.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return FutureBuilder(
              future: AuthService.instance.fetchCurrentUserDoc(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState != ConnectionState.waiting) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const AppPadding.minAll(),
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
                                  decoration:
                                      commonBoxDec(Colors.black, Colors.black, Colors.black),
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
                                // decoration: commonBoxDec(Colors.grey, Colors.grey, Colors.grey),
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
                                style: context.textTheme.titleLarge?.copyWith(
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
                                        title: Text("Email",
                                            style: Theme.of(context).textTheme.titleSmall),
                                        subtitle: Text(snapshot.data!["email"].toString(),
                                            style: Theme.of(context).textTheme.bodyLarge),
                                      ),
                                      GestureDetector(
                                        onTap: () => context.read<GlobalCubit>().changeTheme(),
                                        child: ListTile(
                                          leading: const Icon(Icons.light_mode_outlined),
                                          title: Text(
                                            "Theme Light",
                                            style: Theme.of(context).textTheme.titleSmall,
                                          ),
                                          subtitle: Text(
                                            "Change theme mode",
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => RouteManager.instance
                                            .pushNamed(path: RouteConstants.bmiCalculator),
                                        child: ListTile(
                                          leading: const Icon(Icons.leave_bags_at_home_outlined),
                                          title: Text("BMI",
                                              style: Theme.of(context).textTheme.titleSmall),
                                          subtitle: Text("See bmi result",
                                              style: Theme.of(context).textTheme.bodyLarge),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: ListTile(
                                          leading: const Icon(Icons.update),
                                          title: Text("Update Profile",
                                              style: Theme.of(context).textTheme.titleSmall),
                                          subtitle: Text("Update your weight, height...",
                                              style: Theme.of(context).textTheme.bodyLarge),
                                        ),
                                        onTap: () async {
                                          RouteManager.instance
                                              .pushNamed(path: RouteConstants.updateUserInfo);
                                        },
                                      ),
                                      GestureDetector(
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.logout,
                                          ),
                                          title: Text("Logout",
                                              style: Theme.of(context).textTheme.titleSmall),
                                          subtitle: Text("Have a good day",
                                              style: Theme.of(context).textTheme.titleSmall),
                                        ),
                                        onTap: () async {
                                          await deleteToken();
                                          AuthService.instance.signOut();
                                          RouteManager.instance
                                              .pushNamed(path: RouteConstants.launch);
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
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        },
      ),
    );
  }
}
