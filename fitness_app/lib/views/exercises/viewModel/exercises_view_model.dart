import 'package:fistness_app_firebase/views/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import '../../service/foods_exercises_service.dart';

class ExercisesViewModel extends ChangeNotifier {
  List<Exercise> exercises = [];
  final IGeneralService GeneralService;
  bool isLoading = false;

  ExercisesViewModel(this.GeneralService) {
    fetchExercisesData();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchExercisesData() async {
    changeLoading();
    exercises = (await GeneralService.fetchExercisesItem())?.exercise ?? [];
    changeLoading();
  }
}
