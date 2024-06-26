import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/gender/enum/gender_states.dart';

class GenderState extends BaseState {
  const GenderState({
    required this.states,
    required this.selectedGender,
    required this.isSelectedList,
  });

  factory GenderState.initial() {
    return const GenderState(
      states: GenderStates.initial,
      selectedGender: 'male',
      isSelectedList: [true, false],
    );
  }
  final GenderStates states;
  final String? selectedGender;
  final List<bool> isSelectedList;

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
