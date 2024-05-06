import 'package:fistness_app_firebase/feature/auth/height/cubit/height_state.dart';
import 'package:fistness_app_firebase/feature/auth/height/cubit/i_height_cubit.dart';

class HeightCubit extends IHeightCubit {
  HeightCubit() : super(HeightState.initial()) {
    init();
  }

  @override
  void init() => emit(state.copyWith(selectedValue: 160));

  //setting the selectedValue to state
  @override
  void setSelectedValue(int value) => emit(state.copyWith(selectedValue: value));

  @override
  int get selectedValue => state.selectedValue!;
}
