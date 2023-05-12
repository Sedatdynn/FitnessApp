import 'package:cloud_firestore/cloud_firestore.dart';
import '../../views_shelf.dart';
import '../model/foods_model.dart';
import '../../service/foods_exercises_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Kategori> foods = [];
  final IGeneralService generalService;
  double totalPoint = 0.0;
  bool isLoading = false;

  HomeViewModel(this.generalService) {
    fetch();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetch() async {
    changeLoading();
    foods = (await generalService.fetchFoodsItem())?.kategori ?? [];
    changeLoading();
  }
}
