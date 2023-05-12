import '../../service/i_foods_service.dart';
import '../../views_shelf.dart';
import '../model/foods_model.dart';

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
