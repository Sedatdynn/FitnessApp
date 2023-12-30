import 'package:fistness_app_firebase/product/global/service/global_service.dart';

import '../../../core/cache/cache_manager.dart';
import '../../../core/init/theme/theme.dart';
import '../../../core/service/auth_service.dart';
import '../../../feature/views_shelf.dart';
import '../../enum/cache/cache_enum.dart';
import '../../models/user_model.dart';
import '../../widget/warning/warning_toast.dart';
import 'global_state.dart';
import 'i_global_cubit.dart';

class GlobalCubit extends IGlobalCubit {
  GlobalCubit() : super(GlobalState.initial());

  @override
  void init() {
    getCurrentTheme();
    getUser();
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

  Future<void> getUser() async {
    final userDoc = await AuthService.instance.fetchCurrentUserDoc();
    userDoc.fold((l) => warningToast(l.message), (r) => emit(state.copyWith(user: r)));
  }

  void setUser(UserModel user) async {
    emit(state.copyWith(user: user));
  }

  updateUserRightPoint() async {
    int userRightPoint = await GlobalService().calculateTotalPoints(params: user);
    final updatedUser = state.user?.copyWith(userRightPoint: userRightPoint);
    emit(state.copyWith(user: updatedUser));
  }

  void updateUserHeight(int height) {
    if (height.toString().isEmpty) return;
    final updatedUser = state.user?.copyWith(height: height);
    emit(state.copyWith(user: updatedUser));
  }

  void updateUserWeight(int weight) {
    if (weight.toString().isEmpty) return;
    final updatedUser = state.user?.copyWith(weight: weight);
    emit(state.copyWith(user: updatedUser));
  }

  void updateUserMobility(String mobility) {
    if (mobility.isEmpty) return;
    final updatedUser = state.user?.copyWith(mobility: mobility);
    emit(state.copyWith(user: updatedUser));
  }

  UserModel get user => state.user ?? const UserModel();
}

enum ThemeConstants { light, dark }
