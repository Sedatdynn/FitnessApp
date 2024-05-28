import 'package:core/core.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/global/cubit/i_global_cubit.dart';
import 'package:fistness_app_firebase/product/global/global_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';
import 'package:fistness_app_firebase/product/theme/theme.dart';
import 'package:ui_kit/warning/warning_toast.dart';

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
    final theme = isLightTheme ? CustomTheme().lightTheme : CustomTheme().darkTheme;
    emit(state.copyWith(currentTheme: theme));
    return theme;
  }

  /// change the current theme
  @override
  Future<void> changeTheme() async {
    final newTheme = isLightTheme ? ThemeConstants.dark.name : ThemeConstants.light.name;
    // save new theme to cache
    await CacheManager.instance.setStringValue(CacheKeys.theme, newTheme);
    getCurrentTheme();
  }

  // check if current theme is light
  @override
  bool get isLightTheme =>
      (CacheManager.instance.getStringValue(CacheKeys.theme.name) ?? ThemeConstants.dark.name) ==
      ThemeConstants.light.name;

  /// Getting user date from firestore db
  @override
  Future<void> getUser() async {
    //TODO: check if user EXIST
    final userDoc = await AuthService.instance!.fetchCurrentUserDoc(user);
    userDoc.fold(
      (l) => warningToast(l.message),
      (user) => emit(state.copyWith(user: user as UserModel)),
    );
  }

  /// setting the user into the state
  @override
  void setUser(UserModel user) => emit(state.copyWith(user: user));

  /// update user Score when user updated information
  @override
  Future<void> updateUserRightPoint() async {
    final userRightPoint = await GlobalService().calculateTotalPoints(user: user);
    final updatedUser = state.user?.copyWith(userRightPoint: userRightPoint);
    await AuthService.instance?.updateData(model: updatedUser!);
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
  UserModel get user => state.user ?? UserModel();
}
