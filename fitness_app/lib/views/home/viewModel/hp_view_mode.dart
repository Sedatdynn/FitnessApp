import 'package:fistness_app_firebase/views/views_shelf.dart';

import '../model/foods_model.dart';
import '../service/foods_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Kategori> foods = [];
  final IFoodService foodService;
  double totalPoint = 0.0;
  bool isLoading = false;

  HomeViewModel(this.foodService) {
    fetch();
  }

  void changeLoading() {
    print("+++++++++++++++++++++++++" + "foods.toString()");
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetch() async {
    changeLoading();
    foods = (await foodService.fetchFoodsItem())?.kategori ?? [];
    print("+++++++++++++++++++++++++" + foods.toString());
    changeLoading();
  }
}
