import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/mobility/enum/mobility_states.dart';

class MobilityState extends BaseState {
  const MobilityState({required this.states, required this.selectedItem});

  factory MobilityState.initial() {
    return const MobilityState(
      states: MobilityStates.initial,
      selectedItem: null,
    );
  }
  final MobilityStates states;
  final String? selectedItem;

  @override
  List<Object?> get props => [states, selectedItem];

  MobilityState copyWith({
    MobilityStates? states,
    String? selectedItem,
  }) {
    return MobilityState(
      states: states ?? this.states,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}
