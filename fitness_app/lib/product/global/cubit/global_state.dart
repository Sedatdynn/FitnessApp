// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

class GlobalState extends BaseState {
  const GlobalState({required this.states, required this.currentTheme});
  final GlobalStates states;
  final ThemeData? currentTheme;

  factory GlobalState.initial() {
    return const GlobalState(states: GlobalStates.initial, currentTheme: null);
  }

  @override
  List<Object?> get props => [states, currentTheme];

  GlobalState copyWith({
    GlobalStates? states,
    ThemeData? currentTheme,
  }) {
    return GlobalState(
        states: states ?? this.states, currentTheme: currentTheme ?? this.currentTheme);
  }
}

enum GlobalStates { initial, loading, completed, error }
