import 'dart:ui';

import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_state.dart';

abstract class IGenderCubit extends BaseCubit<GenderState> {
  IGenderCubit(super.initialState);
  void setSelectedGender(String gender);
  void toggleOnPressed(int index);
  Color get femaleTextColor;
  Color get maleTextColor;
  Color get maleIconColor;
  Color get femaleIconColor;
}
