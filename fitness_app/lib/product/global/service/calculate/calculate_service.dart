import 'package:fistness_app_firebase/feature/auth/gender/cubit/gender_cubit.dart';
import 'package:fistness_app_firebase/product/global/service/calculate/i_calculate_service.dart';

// calculate point depends on user work
final class Mobility implements ICalculateService<String> {
  @override
  int calculate(String value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    // getting first letter of the user's Mobility
    final mobilityControl = value.substring(0, 1);
    switch (mobilityControl) {
      case 'D':
        break;
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
    final point = updatedTotalPoint;
    // getting current year
    final currentYear = DateTime.now().year;
    final yearsPassed = currentYear - value;
    // adding score depends on user age
    if (yearsPassed <= 20) {
      return point + 5;
    }
    if (yearsPassed <= 35) {
      return point + 4;
    }
    if (yearsPassed <= 50) {
      return point + 3;
    }
    if (yearsPassed <= 65) {
      return point + 2;
    }
    return point;
  }
}

// calculate point depends on user Weight
final class Weight implements ICalculateService<int> {
  @override
  int calculate(int value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    // change int to String to can reach the value's length
    final stringValue = value.toString();
    switch (stringValue.length) {
      case 2:
        // depends on user Weight if the value is 50 score will be 5 is the value is 90 score will be 9
        final mobilityPoint = stringValue.substring(0, 1);
        return point += int.parse(mobilityPoint);
      case 3:
        // depends on user Weight if the value is 100 score will be 10 is the value is 150 score will be 15
        final mobilityPoint = stringValue.substring(0, 2);
        return point += int.parse(mobilityPoint);
      default:
        return point;
    }
  }
}

// calculate point depends on user Height
final class Height implements ICalculateService<int> {
  @override
  int calculate(int value, int updatedTotalPoint) =>
      value >= 160 ? updatedTotalPoint + 2 : updatedTotalPoint + 1;
}

// calculate point depends on user Gender
final class Gender implements ICalculateService<String> {
  @override
  int calculate(String value, int updatedTotalPoint) {
    var point = updatedTotalPoint;
    // check user's gender and calculate the point
    return value == GenderEnum.female.name ? point += 7 : point += 15;
  }
}
