import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';

abstract class IGlobalCubit extends BaseCubit<GlobalState> {
  IGlobalCubit(super.initialState);
}
