import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_state.dart';

abstract class IDietCubit extends BaseCubit<DietState> {
  IDietCubit(super.initialState);
  Future<void> fetch();
  Future<void> savePoint();
  double get getCachedPoint;
  Future<void> resetPoint();
  Future<void> checkBoxActivity(int index1, int index2, {required bool value});
  Future<void> clearList();
}
