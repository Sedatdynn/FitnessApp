import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/init/theme/theme.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/global/cubit/i_global_cubit.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

class GlobalCubit extends IGlobalCubit {
  GlobalCubit() : super(GlobalState.initial());

  @override
  void init() {
    getCurrentTheme();
    setUser();
  }

  ThemeData getCurrentTheme() {
    var value = CacheManager.instance.getStringValue(CacheKeys.theme.name);
    value ??= ThemeConstants.dark.name;
    if (value == ThemeConstants.light.name) {
      emit(state.copyWith(currentTheme: CustomTheme().lightTheme));
      return state.currentTheme!;
    } else {
      emit(state.copyWith(currentTheme: CustomTheme().darkTheme));
      return state.currentTheme!;
    }
  }

  changeTheme() async {
    if (state.currentTheme != CustomTheme().lightTheme) {
      await CacheManager.instance.setStringValue(CacheKeys.theme, ThemeConstants.light.name);
    } else {
      await CacheManager.instance.setStringValue(CacheKeys.theme, ThemeConstants.dark.name);
    }
    getCurrentTheme();
  }

  void setUser() async {
    print('setUser detected');
    final userDoc = await AuthService.instance.fetchCurrentUserDoc();
    userDoc.fold((l) => null, (r) => emit(state.copyWith(user: r)));
  }

  UserModel get user => state.user ?? UserModel();
}

enum ThemeConstants { light, dark }
