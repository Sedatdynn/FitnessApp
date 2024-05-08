import 'package:fistness_app_firebase/product/models/user_model.dart';

abstract class IGlobalService {
  String calculateBmi({required UserModel user});
  Future<int> calculateTotalPoints({required UserModel user});
}
