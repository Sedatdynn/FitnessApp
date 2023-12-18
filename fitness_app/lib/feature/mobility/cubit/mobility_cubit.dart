import 'package:fistness_app_firebase/feature/mobility/cubit/i_mobility_cubit.dart';
import 'package:fistness_app_firebase/feature/mobility/cubit/mobility_state.dart';

class MobilityCubit extends IMobilityCubit {
  MobilityCubit() : super(MobilityState.initial()) {
    init();
  }
  final List<String> items = <String>[
    'Desk job or sedentary',
    'Both at the table and standing',
    'Those on the move during the day',
    'Active employees'
  ];
  @override
  void init() {}
  setSelectedItem(String item) {
    emit(state.copyWith(selectedItem: item));
  }
}
