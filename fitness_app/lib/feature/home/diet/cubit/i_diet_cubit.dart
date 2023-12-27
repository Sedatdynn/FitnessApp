import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_state.dart';

abstract class IDietCubit extends BaseCubit<DietState> {
  IDietCubit(super.initialState);
  setTotalPoint(double point);
}
