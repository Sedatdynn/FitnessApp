import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/home/profile/cubit/i_profile_cubit.dart';
import 'package:fistness_app_firebase/feature/home/profile/cubit/profile_state.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';

class ProfileCubit extends IProfileCubit {
  ProfileCubit() : super(ProfileState.initial());

  @override
  void init() {}

  void setUser() async {
    final userDoc = await AuthService.instance.fetchCurrentUserDoc();
    userDoc.fold((l) => warningToast(l.message), (r) => emit(state.copyWith(user: r)));
  }

  UserModel get user => state.user ?? const UserModel();

  @override
  setHeight() {}

  @override
  setWeight() {}
}

enum ThemeConstants { light, dark }
