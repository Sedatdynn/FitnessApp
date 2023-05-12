import '../../service/i_foods_service.dart';
import '../../views_shelf.dart';
import '../model/exercises_model.dart';

class ExercisesViewModel extends ChangeNotifier {
  List<Exercise> exercises = [];
  final IFoodsService foodService;
  bool isLoading = false;

  ExercisesViewModel(this.foodService) {
    fetchExercisesData();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchExercisesData() async {
    changeLoading();
    exercises = (await foodService.fetchExercisesItem())?.exercise ?? [];
    changeLoading();
  }
}
