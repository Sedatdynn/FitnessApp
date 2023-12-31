import 'package:fistness_app_firebase/core/base/exception/exception.dart';
import 'package:fistness_app_firebase/core/init/network/network_manager.dart';
import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';

import 'i_diet_service.dart';

class DietService extends IDietService {
  DietService();

  @override
  BaseResponseData<FoodsModel> fetchDiets() async {
    final response =
        await NetworkManager.instance.dioGet(path: '/foods', model: const FoodsModel());
    if (response is ServerException) {
      return Left(ServerException(message: response.message, statusCode: response.statusCode));
    } else {
      return Right(response);
    }
  }
}
