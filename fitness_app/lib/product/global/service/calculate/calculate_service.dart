import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_cubit.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';

import 'i_calculate_service.dart';

// calculate point depends on user work
final class Mobility implements ICalculateService<String> {
  @override
  void calculate(String value, int updatedTotalPoint) {
    String mobilityControl = value.substring(0, 1);
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

// calculate point depends on user Age
final class Age implements ICalculateService<int> {
  @override
  void calculate(int value, int updatedTotalPoint) {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    value = currentYear - value;
    if (value <= 20) {
      updatedTotalPoint + 5;
    } else if (value >= 21 && value <= 35) {
      updatedTotalPoint += 4;
    } else if (value >= 36 && value <= 50) {
      updatedTotalPoint += 3;
    } else if (value >= 51 && value <= 65) {
      updatedTotalPoint += 2;
    }
  }
}

// calculate point depends on user Weight
final class Weight implements ICalculateService<int> {
  @override
  void calculate(int value, int updatedTotalPoint) {
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
      if (value >= rangeStart && value <= rangeStart + 9) {
        updatedTotalPoint += points;
      }
    });
  }
}

// calculate point depends on user Height
final class Height implements ICalculateService<int> {
  @override
  void calculate(int value, int updatedTotalPoint) {
    value >= 160 ? updatedTotalPoint += 2 : updatedTotalPoint += 1;
  }
}

// calculate point depends on user Gender
final class Gender implements ICalculateService<String> {
  @override
  void calculate(String value, int updatedTotalPoint) {
    value == GenderEnum.female.name ? updatedTotalPoint += 7 : updatedTotalPoint += 15;
  }
}
