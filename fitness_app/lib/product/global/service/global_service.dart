import 'package:fistness_app_firebase/product/global/service/calculate/calculate_service.dart';
import '../../models/user_model.dart';
import 'i_global_service.dart';

class GlobalService extends IGlobalService {
  int updatedTotalPoint = 0;
  // dropdown menu items
  static const List<String> items = <String>[
    'Desk job or sedentary',
    'Both at the table and standing',
    'Those on the move during the day',
    'Active employees'
  ];

  // find user's bmi result
  @override
  String calculateBmi({required int height, required int weight}) {
    double result = weight / (height * height / 10000);
    return result.toStringAsFixed(2);
  }

  //calculate user point for showing user's right point to eating
  @override
  Future<int> calculateTotalPoints({required UserModel user}) async {
    Age().calculate(user.age!, updatedTotalPoint);
    Weight().calculate(user.weight!, updatedTotalPoint);
    Height().calculate(user.height!, updatedTotalPoint);
    Gender().calculate(user.gender!, updatedTotalPoint);
    Mobility().calculate(user.mobility!, updatedTotalPoint);
    Future.delayed(const Duration(seconds: 2));

    return updatedTotalPoint;
  }
}
