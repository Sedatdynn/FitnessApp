import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_cubit.dart';
import 'package:fistness_app_firebase/product/global/service/calculate/i_calculate_service.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';

// calculate point depends on user work
final class Mobility implements ICalculateService<String> {
  @override
  int calculate(String value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    final mobilityControl = value.substring(0, 1);
    switch (mobilityControl) {
      case 'D':
        point += 0;
      case 'B':
        point += 2;
      case 'T':
        point += 4;
      case 'A':
        point += 6;
    }
    return point;
  }
}

// calculate point depends on user Age
final class Age implements ICalculateService<int> {
  @override
  int calculate(int value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    final now = DateTime.now();
    final currentYear = now.year;
    final lastValue = currentYear - value;
    if (lastValue <= 20) {
      point += 5;
    } else if (lastValue >= 21 && lastValue <= 35) {
      point += 4;
    } else if (lastValue >= 36 && lastValue <= 50) {
      point += 3;
    } else if (lastValue >= 51 && lastValue <= 65) {
      point += 2;
    }
    return point;
  }
}

// calculate point depends on user Weight
final class Weight implements ICalculateService<int> {
  @override
  int calculate(int value, int updatedTotalPoint) {
    const pointsMap = {
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

    return calculateMap(pointsMap, value, updatedTotalPoint);
  }

  int calculateMap(WeightMapType pointsMap, int value, int initialTotalPoint) {
    var updatedTotalPoint = initialTotalPoint;
    var found = false;
    pointsMap.forEach((rangeStart, points) {
      if (!found && value >= rangeStart && value <= rangeStart + 9) {
        updatedTotalPoint += points;
        found = true;
      }
    });
    return updatedTotalPoint;
  }
}

// calculate point depends on user Height
final class Height implements ICalculateService<int> {
  @override
  int calculate(int value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    value >= 160 ? point += 2 : point += 1;
    return point;
  }
}

// calculate point depends on user Gender
final class Gender implements ICalculateService<String> {
  @override
  int calculate(String value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    value == GenderEnum.female.name ? point += 7 : point += 15;
    return point;
  }
}
