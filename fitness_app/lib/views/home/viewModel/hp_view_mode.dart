import 'package:fistness_app_firebase/views/views_shelf.dart';
import '../model/foods_model.dart';
import '../../service/foods_exercises_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Kategori> foods = [];
  final IGeneralService GeneralService;
  double totalPoint = 0.0;
  bool isLoading = false;

  HomeViewModel(this.GeneralService) {
    fetch();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetch() async {
    changeLoading();
    foods = (await GeneralService.fetchFoodsItem())?.kategori ?? [];
    changeLoading();
  }
}
