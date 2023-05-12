import '../../service/foods_exercises_service.dart';
import '../../views_shelf.dart';
import '../model/exercises_model.dart';

class ExercisesViewModel extends ChangeNotifier {
  List<Exercise> exercises = [];
  final IGeneralService generalService;
  bool isLoading = false;

  ExercisesViewModel(this.generalService) {
    fetchExercisesData();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchExercisesData() async {
    changeLoading();
    exercises = (await generalService.fetchExercisesItem())?.exercise ?? [];
    changeLoading();
  }
}
