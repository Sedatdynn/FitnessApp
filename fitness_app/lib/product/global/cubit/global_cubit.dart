import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/init/theme/theme.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/enum/theme/theme_enum.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/global/cubit/i_global_cubit.dart';
import 'package:fistness_app_firebase/product/global/service/global_service.dart';

import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';

class GlobalCubit extends IGlobalCubit {
  GlobalCubit() : super(GlobalState.initial()) {
    init();
  }

  /// initial func
  @override
  void init() {
    getCurrentTheme();
    getUser();
  }

  /// getting current theme from cache
  @override
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

  /// change the current theme
  @override
  Future<void> changeTheme() async {
    if (state.currentTheme != CustomTheme().lightTheme) {
      await CacheManager.instance.setStringValue(CacheKeys.theme, ThemeConstants.light.name);
    } else {
      await CacheManager.instance.setStringValue(CacheKeys.theme, ThemeConstants.dark.name);
    }
    getCurrentTheme();
  }

  /// Getting user date from firestore db
  @override
  Future<void> getUser() async {
    final userDoc = await AuthService.instance.fetchCurrentUserDoc();
    userDoc.fold(
      (l) => warningToast(l.message),
      (user) => emit(state.copyWith(user: user as UserModel)),
    );
  }

  /// setting the user into the state
  @override
  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
  }

  /// update user Score when user updated information
  @override
  Future<void> updateUserRightPoint() async {
    final userRightPoint = await GlobalService().calculateTotalPoints(user: user);
    final updatedUser = state.user?.copyWith(userRightPoint: userRightPoint);
    await AuthService.instance.updateData(model: updatedUser!);
    emit(state.copyWith(user: updatedUser));
  }

  /// update user height
  @override
  void updateUserHeight(int height) {
    if (height.toString().isEmpty) return;
    final updatedUser = state.user?.copyWith(height: height);
    emit(state.copyWith(user: updatedUser));
  }

  /// update user weight
  @override
  void updateUserWeight(int weight) {
    if (weight.toString().isEmpty) return;
    final updatedUser = state.user?.copyWith(weight: weight);
    emit(state.copyWith(user: updatedUser));
  }

  /// update user mobility
  @override
  void updateUserMobility(String mobility) {
    if (mobility.isEmpty) return;
    final updatedUser = state.user?.copyWith(mobility: mobility);
    emit(state.copyWith(user: updatedUser));
  }

  /// getter for user
  @override
  UserModel get user => state.user ?? const UserModel();
}
