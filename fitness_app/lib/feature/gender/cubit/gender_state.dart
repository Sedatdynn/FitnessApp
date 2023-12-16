import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/gender/enum/gender_states.dart';

class GenderState extends BaseState {
  const GenderState(
      {required this.states, required this.selectedGender, required this.isSelectedList});
  final GenderStates states;
  final String? selectedGender;
  final List<bool> isSelectedList;

  factory GenderState.initial() {
    return const GenderState(
      states: GenderStates.initial,
      selectedGender: 'male',
      isSelectedList: [true, false],
    );
  }

  @override
  List<Object?> get props => [states, selectedGender, isSelectedList];

  GenderState copyWith({
    GenderStates? states,
    String? selectedGender,
    List<bool>? isSelectedList,
  }) {
    return GenderState(
      states: states ?? this.states,
      selectedGender: selectedGender ?? this.selectedGender,
      isSelectedList: isSelectedList ?? this.isSelectedList,
    );
  }
}
