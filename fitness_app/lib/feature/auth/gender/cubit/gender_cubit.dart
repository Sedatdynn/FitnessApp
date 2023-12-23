import 'dart:ui';

import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_state.dart';
import 'package:fistness_app_firebase/feature/auth/gender/cubit/i_gender_cubit.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';

class GenderCubit extends IGenderCubit {
  GenderCubit() : super(GenderState.initial());

  @override
  void init() {}

  @override
  void setSelectedGender(String gender) => emit(state.copyWith(selectedGender: gender));
  String get selectedGender => state.selectedGender!;

  @override
  void toggleOnPressed(int index) {
    if (index == kZero) {
      emit(state.copyWith(isSelectedList: [true, false]));
      setSelectedGender(GenderEnum.male.name);
    } else {
      emit(state.copyWith(isSelectedList: [false, true]));
      setSelectedGender(GenderEnum.female.name);
    }
  }

  @override
  Color get femaleTextColor =>
      state.isSelectedList[kOne] == true ? AppColors.loadingColor : AppColors.white;
  @override
  Color get maleTextColor =>
      state.isSelectedList[kZero] == true ? AppColors.loadingColor : AppColors.white;
  @override
  Color get maleIconColor => state.isSelectedList[kZero] == true ? AppColors.blue : AppColors.white;
  @override
  Color get femaleIconColor =>
      state.isSelectedList[kOne] == true ? AppColors.error : AppColors.white;
}

enum GenderEnum { male, female }

const kZero = 0;
const kOne = 1;
