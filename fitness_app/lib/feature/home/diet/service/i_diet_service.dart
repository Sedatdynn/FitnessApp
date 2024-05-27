import 'package:core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';

abstract class IDietService {
  BaseResponseData<FoodsModel> fetchDiets();
}
