import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/cubit/mobility_state.dart';

abstract class IMobilityCubit extends BaseCubit<MobilityState> {
  IMobilityCubit(super.initialState);
  void setSelectedItem(String item);
}
