import 'package:fistness_app_firebase/feature/homex/home/model/foods_model.dart';
import 'package:fistness_app_firebase/feature/service/i_foods_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

class HomeViewModel extends ChangeNotifier {
  List<Kategori> foods = [];
  final IFoodsService foodService;
  double totalPoint = 0.0;
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
