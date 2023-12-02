import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

abstract class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);
  void init();

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
