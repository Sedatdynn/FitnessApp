import '../../../feature/auth/gender/cubit/gender_cubit.dart';
import '../../models/user_model.dart';
import 'i_global_service.dart';

class GlobalService extends IGlobalService {
  int updatedTotalPoint = 0;
  final List<String> items = <String>[
    'Desk job or sedentary',
    'Both at the table and standing',
    'Those on the move during the day',
    'Active employees'
  ];

  @override
  calculateBmi({required int height, required int weight}) {
    double result = int.parse(weight.toString()) /
        (int.parse(height.toString()) * int.parse(height.toString()) / 10000);
    String bmi = result.toStringAsFixed(2);
    return bmi;
  }

  @override
  Future<int> calculateTotalPoints({required UserModel params}) async {
    calculateAge(params.age!);

    calculateWeight(params.weight!);

    params.height! >= 160 ? updatedTotalPoint += 2 : updatedTotalPoint += 1;

    params.gender == GenderEnum.female.name ? updatedTotalPoint += 7 : updatedTotalPoint += 15;

    calculateMobility(params.mobility!);
    Future.delayed(const Duration(seconds: 2));

    return updatedTotalPoint;
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
