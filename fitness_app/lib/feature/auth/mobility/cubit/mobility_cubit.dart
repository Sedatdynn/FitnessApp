import 'package:fistness_app_firebase/feature/auth/mobility/cubit/i_mobility_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/cubit/mobility_state.dart';

class MobilityCubit extends IMobilityCubit {
  MobilityCubit() : super(MobilityState.initial()) {
    init();
  }

  @override
  void init() {}
  setSelectedItem(String item) {
    emit(state.copyWith(selectedItem: item));
  }
}
