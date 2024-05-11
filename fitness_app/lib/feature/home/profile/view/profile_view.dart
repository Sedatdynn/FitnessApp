import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/core/core_shelf.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/global/global_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part '../subview/profile_subview.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  // delete user token from cache
  Future<void> deleteToken() async {
    await CacheManager.instance.removeValue(CacheKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CustomProfileAppBar(),
      body: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return Padding(
            padding: const AppPadding.minAll(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(state.user?.name ?? '', style: context.textTheme.titleLarge),
                ),
                SizedBox(height: 60.h),
                Column(
                  children: <Widget>[
                    ...ListTile.divideTiles(
                      color: AppColors.mainPrimary,
                      tiles: _tilesList(state, context),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _tilesList(GlobalState state, BuildContext context) {
    return [
      _ProfileSectionListTile(
        icon: Icons.email,
        title: LocaleKeys.Auth_emailText.tr(),
        subtitle: state.user?.email ?? '',
        onTap: () {},
      ),
      _ProfileSectionListTile(
        icon: Icons.light_mode_outlined,
        title: LocaleKeys.Profile_theme.tr(),
        subtitle: LocaleKeys.Profile_changeTheme.tr(),
        onTap: () => context.read<GlobalCubit>().changeTheme(),
      ),
      _ProfileSectionListTile(
        icon: Icons.leave_bags_at_home_outlined,
        title: 'BMI',
        subtitle: LocaleKeys.Profile_seeBmiResult.tr(),
        onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.bmiCalculator),
      ),
      _ProfileSectionListTile(
        icon: Icons.update,
        title: LocaleKeys.Profile_updateProfileTitle.tr(),
        subtitle: LocaleKeys.Profile_updateProfileSubtitle.tr(),
        onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.updateUserInfo),
      ),
      _ProfileSectionListTile(
        icon: Icons.language_outlined,
        title: LocaleKeys.Profile_language.tr(),
        subtitle: LocaleKeys.Profile_changeLanguage.tr(),
        onTap: () => LanguageManager.instance!.changeLanguage(context: context),
      ),
      _ProfileSectionListTile(
        icon: Icons.logout,
        title: LocaleKeys.Profile_logOut.tr(),
        subtitle: LocaleKeys.Profile_logoutSubtitle.tr(),
        onTap: () async {
          await deleteToken();
          await AuthService.instance!.signOut();
          RouteManager.instance.pushNamed(path: RouteConstants.launch);
        },
      ),
    ];
  }
}
