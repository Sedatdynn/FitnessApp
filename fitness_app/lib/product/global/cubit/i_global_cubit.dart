import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:flutter/material.dart';

abstract class IGlobalCubit extends BaseCubit<GlobalState> {
  IGlobalCubit(super.initialState);
  ThemeData getCurrentTheme();
  Future<void> changeTheme();
  Future<void> getUser();
  void setUser(UserModel user);
  Future<void> updateUserRightPoint();
  void updateUserHeight(int height);
  void updateUserWeight(int weight);
  void updateUserMobility(String mobility);

  UserModel get user;
}
