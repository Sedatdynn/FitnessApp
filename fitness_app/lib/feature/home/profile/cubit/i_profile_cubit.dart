import 'package:fistness_app_firebase/core/base/cubit/base_cubit.dart';
import 'package:fistness_app_firebase/feature/home/profile/cubit/profile_state.dart';

abstract class IProfileCubit extends BaseCubit<ProfileState> {
  IProfileCubit(super.initialState);
  setHeight();
  setWeight();
}
