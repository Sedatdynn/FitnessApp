import 'package:fistness_app_firebase/product/models/user_model.dart';

abstract class IGlobalService {
  calculateBmi({required int height, required int weight});
  Future<int> calculateTotalPoints({required UserModel params});
  void calculateWeight(int weight);
  void calculateAge(int age);
  void calculateMobility(String mobility);
}
