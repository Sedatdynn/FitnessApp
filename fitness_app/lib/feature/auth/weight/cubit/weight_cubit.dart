import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/i_weight_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/weight_state.dart';
import 'package:fistness_app_firebase/feature/auth/weight/params/calculate_func_params.dart';
import 'package:fistness_app_firebase/feature/auth/weight/params/weight_params.dart';
import 'package:fistness_app_firebase/product/const/text/texts.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';

class WeightCubit extends IWeightCubit {
  WeightCubit() : super(WeightState.initial()) {
    init();
  }
  int updatedTotalPoint = 0;

  @override
  void init() => emit(state.copyWith(selectedValue: 65));

  @override
  setSelectedValue(int value) {
    emit(state.copyWith(selectedValue: value));
  }

  @override
  setTotalPoint(int value) {
    emit(state.copyWith(totalPoint: value));
  }

  @override
  int get selectedValue => state.selectedValue!;
  int get getTotal => state.totalPoint!;

  @override
  Future<void> calculateTotalPoints({required CalculateParams params}) async {
    calculateAge(params.birthYear!);

    calculateWeight(state.selectedValue!);

    params.height! >= 160 ? updatedTotalPoint += 2 : updatedTotalPoint += 1;

    params.gender == GenderEnum.female.name ? updatedTotalPoint += 7 : updatedTotalPoint += 15;

    calculateMobility(params.mobility!);

    Future.delayed(const Duration(seconds: 2));

    setTotalPoint(updatedTotalPoint);
  }

  Future<void> createPerson({required WeightParams params}) async {
    final result = await AuthService.instance.createPerson(
        model: UserModel(
            username: params.username,
            email: params.mail,
            name: params.name,
            password: params.password,
            gender: params.gender,
            age: params.birthYear.toString(),
            mobility: params.mobility,
            height: params.height.toString(),
            weight: state.selectedValue!.toString(),
            userRightPoint: state.totalPoint.toString()));

    result.fold((failure) async {
      emit(state.copyWith(errorMessage: failure.message));
    }, (r) async {
      await warningToast(RegisterText.registerSuccessfully, color: AppColors.green);
      await warningToast(RegisterText.verifyWarning, color: AppColors.green);
      RouteManager.instance.pushAndPopUntil(LoginRoute(canPop: false));
    });
  }

  @override
  void calculateWeight(int weight) {
    const WeightMapType pointsMap = {
      40: 4,
      50: 5,
      60: 6,
      70: 7,
      80: 8,
      90: 9,
      100: 10,
      110: 11,
      120: 12,
      130: 13,
      140: 14,
      150: 15,
      160: 16,
    };

    pointsMap.forEach((rangeStart, points) {
      if (weight >= rangeStart && weight <= rangeStart + 9) {
        updatedTotalPoint += points;
      }
    });
  }

  @override
  void calculateAge(int age) {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    age = currentYear - age;
    if (age <= 20) {
      updatedTotalPoint + 5;
    } else if (age >= 21 && age <= 35) {
      updatedTotalPoint += 4;
    } else if (age >= 36 && age <= 50) {
      updatedTotalPoint += 3;
    } else if (age >= 51 && age <= 65) {
      updatedTotalPoint += 2;
    }
  }

  @override
  void calculateMobility(String mobility) {
    String mobilityControl = mobility.substring(0, 1);
    switch (mobilityControl) {
      case 'D':
        updatedTotalPoint += 0;
      case 'B':
        updatedTotalPoint += 2;
      case 'T':
        updatedTotalPoint += 4;
      case 'A':
        updatedTotalPoint += 6;
    }
  }
}

typedef WeightMapType = Map<int, int>;
