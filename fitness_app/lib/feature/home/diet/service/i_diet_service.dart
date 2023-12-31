import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';

abstract class IDietService {
  BaseResponseData<FoodsModel> fetchDiets();
}
