import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/height/cubit/height_state.dart';

abstract class IHeightCubit extends BaseCubit<HeightState> {
  IHeightCubit(super.initialState);
  int get selectedValue;
  void setSelectedValue(int value);
}
