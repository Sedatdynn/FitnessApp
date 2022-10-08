import 'package:fistness_app_firebase/product/global/change_loading.dart';
import 'package:fistness_app_firebase/product/service/dio_manager.dart';
import 'package:fistness_app_firebase/views/home/model/foods_model.dart';
import 'package:fistness_app_firebase/views/home/service/foods_service.dart';
import '../view/home_page.dart';

abstract class HomeViewModel extends LoadingStateful<HomeView>
    with ProjectDioMixin {
  List<Kategori> foods = [];
  late final IFoodService foodService;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    foodService = FoodService(service);
    fetch();
  }

  Future<void> fetch() async {
    changeLoading();
    foods = (await foodService.fetchFoodsItem())?.kategori ?? [];
    changeLoading();
  }
}
