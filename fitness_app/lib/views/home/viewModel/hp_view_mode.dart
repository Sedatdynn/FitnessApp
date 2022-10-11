import 'package:fistness_app_firebase/views/views_shelf.dart';

import '../model/foods_model.dart';
import '../service/foods_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Kategori> foods = [];
  final IFoodService foodService;
  int totalPoint = 0;
  bool isLoading = false;

  HomeViewModel(this.foodService) {
    fetch();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetch() async {
    changeLoading();
    foods = (await foodService.fetchFoodsItem())?.kategori ?? [];
    changeLoading();
  }
}
