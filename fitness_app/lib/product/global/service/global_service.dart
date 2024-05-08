import 'package:fistness_app_firebase/product/global/service/calculate/calculate_service.dart';
import 'package:fistness_app_firebase/product/global/service/i_global_service.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';

class GlobalService extends IGlobalService {
  int updatedTotalPoint = 0;
  // dropdown menu items
  static const List<String> items = <String>[
    'Desk job or sedentary',
    'Both at the table and standing',
    'Those on the move during the day',
    'Active employees',
  ];

  // find user's bmi result
  @override
  String calculateBmi({required UserModel user}) {
    final result = user.weight! / (user.height! * user.height! / 10000);
    return result.toStringAsFixed(2);
  }

  //calculate user point for showing user's right point to eating
  @override
  Future<int> calculateTotalPoints({required UserModel user}) async {
    final agePoint = Age().calculate(user.age!, updatedTotalPoint);
    final weightPoint = Weight().calculate(user.weight!, agePoint);
    final heightPoint = Height().calculate(user.height!, weightPoint);
    final genderPoint = Gender().calculate(user.gender!, heightPoint);
    final totalPoint = Mobility().calculate(user.mobility!, genderPoint);
    await Future<void>.delayed(const Duration(seconds: 1));
    return totalPoint;
  }
}
