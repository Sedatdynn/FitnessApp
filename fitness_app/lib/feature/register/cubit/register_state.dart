import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/register/enum/register_states.dart';

class RegisterState extends BaseState {
  const RegisterState(
      {required this.username,
      required this.nameSurname,
      required this.email,
      required this.password,
      required this.isVisible,
      required this.states});
  final RegisterStates states;
  final String? username;
  final String? nameSurname;
  final String? email;
  final String? password;
  final bool isVisible;

  factory RegisterState.initial() {
    return const RegisterState(
      states: RegisterStates.initial,
      username: '',
      nameSurname: '',
      email: '',
      password: '',
      isVisible: true,
    );
  }

  @override
  List<Object?> get props => [states, nameSurname, username, email, password, isVisible];

  RegisterState copyWith({
    RegisterStates? states,
    String? username,
    String? nameSurname,
    String? email,
    String? password,
    bool? isVisible,
  }) {
    return RegisterState(
      states: states ?? this.states,
      username: username ?? this.username,
      nameSurname: nameSurname ?? this.nameSurname,
      email: email ?? this.email,
      password: password ?? this.password,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
