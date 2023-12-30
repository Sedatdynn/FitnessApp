import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

class ProfileState extends BaseState {
  const ProfileState({required this.states, required this.user});
  final ProfileStates states;
  final UserModel? user;

  factory ProfileState.initial() {
    return const ProfileState(states: ProfileStates.initial, user: null);
  }

  @override
  List<Object?> get props => [states, user];

  ProfileState copyWith({
    ProfileStates? states,
    UserModel? user,
  }) {
    return ProfileState(
      states: states ?? this.states,
      user: user ?? this.user,
    );
  }
}

enum ProfileStates { initial, loading, completed, error }
