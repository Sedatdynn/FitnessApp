import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/navigator/auto_route_path.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  Future deleteToken() async {
    await CacheManager.instance.removeValue(CacheKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => RouteManager.instance.pushNamed(path: RouteConstants.main)),
        actions: const [
          Padding(
            padding: AppPadding.normalHorizontal(),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return Padding(
            padding: const AppPadding.minAll(),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Text(context.watch<GlobalCubit>().user.name ?? '',
                        style: context.textTheme.titleLarge)),
                SizedBox(height: 60.h),
                Column(
                  children: <Widget>[
                    ...ListTile.divideTiles(
                      color: AppColors.mainPrimary,
                      tiles: [
                        _ProfileSectionListTile(
                            icon: Icons.email,
                            title: "Email",
                            subtitle: context.watch<GlobalCubit>().user.email ?? '',
                            onTap: () {}),
                        _ProfileSectionListTile(
                          icon: Icons.light_mode_outlined,
                          title: "Theme Light",
                          subtitle: "Change theme mode",
                          onTap: () => context.read<GlobalCubit>().changeTheme(),
                        ),
                        _ProfileSectionListTile(
                          icon: Icons.leave_bags_at_home_outlined,
                          title: "BMI",
                          subtitle: "See bmi result",
                          onTap: () =>
                              RouteManager.instance.pushNamed(path: RouteConstants.bmiCalculator),
                        ),
                        _ProfileSectionListTile(
                            icon: Icons.update,
                            title: "Update Profile",
                            subtitle: "Update your weight, height...",
                            onTap: () => RouteManager.instance
                                .pushNamed(path: RouteConstants.updateUserInfo)),
                        _ProfileSectionListTile(
                            icon: Icons.logout,
                            title: "Logout",
                            subtitle: "Have a good day",
                            onTap: () async {
                              await deleteToken();
                              AuthService.instance.signOut();
                              RouteManager.instance.pushNamed(path: RouteConstants.launch);
                            })
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileSectionListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final void Function() onTap;

  const _ProfileSectionListTile(
      {required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title, style: context.textTheme.titleSmall),
      subtitle: Text(subtitle, style: context.textTheme.bodyLarge),
    );
  }
}
