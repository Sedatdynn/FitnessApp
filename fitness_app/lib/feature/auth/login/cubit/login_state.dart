import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';

class LoginState extends BaseState {
  const LoginState({
    required this.states,
    required this.email,
    required this.password,
    required this.isVisible,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return const LoginState(
      states: LoginStates.initial,
      email: '',
      password: '',
      isVisible: true,
      errorMessage: null,
    );
  }
  final LoginStates states;
  final String? email;
  final String? password;
  final bool isVisible;
  final String? errorMessage;

  @override
  List<Object?> get props => [states, email, password, isVisible, errorMessage];

  LoginState copyWith({
    LoginStates? states,
    String? email,
    String? password,
    bool? isVisible,
    String? errorMessage,
  }) {
    return LoginState(
      states: states ?? this.states,
      email: email ?? this.email,
      password: password ?? this.password,
      isVisible: isVisible ?? this.isVisible,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum LoginStates { initial, loading, completed, error }
