import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/init/theme/theme.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/global/cubit/i_global_cubit.dart';

class GlobalCubit extends IGlobalCubit {
  GlobalCubit() : super(GlobalState.initial());

  @override
  void init() {
    getCurrentTheme();
  }

  ThemeData get currentTheme => state.currentTheme!;
  void getCurrentTheme() {
    CacheManager.instance.getStringValue(CacheKeys.theme.name) == ThemeConstants.light.name
        ? emit(state.copyWith(currentTheme: CustomTheme().lightTheme))
        : emit(state.copyWith(currentTheme: CustomTheme().darkTheme));
  }

  changeTheme() {
    state.currentTheme == CustomTheme().lightTheme
        ? CacheManager.instance.setStringValue(CacheKeys.theme, ThemeConstants.dark.name)
        : CacheManager.instance.setStringValue(CacheKeys.theme, ThemeConstants.light.name);
    getCurrentTheme();
    print('getCurrentTheme : $getCurrentTheme');
  }
}

enum ThemeConstants { light, dark }
