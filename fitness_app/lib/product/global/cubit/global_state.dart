// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

class GlobalState extends BaseState {
  const GlobalState({required this.states, required this.currentTheme, required this.user});
  final GlobalStates states;
  final ThemeData? currentTheme;
  final UserModel? user;

  factory GlobalState.initial() {
    return const GlobalState(states: GlobalStates.initial, currentTheme: null, user: null);
  }

  @override
  List<Object?> get props => [states, currentTheme, user];

  GlobalState copyWith({
    GlobalStates? states,
    ThemeData? currentTheme,
    UserModel? user,
  }) {
    return GlobalState(
      states: states ?? this.states,
      currentTheme: currentTheme ?? this.currentTheme,
      user: user ?? this.user,
    );
  }
}

enum GlobalStates { initial, loading, completed, error }
