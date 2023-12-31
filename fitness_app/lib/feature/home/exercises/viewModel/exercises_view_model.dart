import 'package:fistness_app_firebase/feature/home/exercises/service/i_exercise_service.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

import '../model/exercises_model.dart';

class ExercisesViewModel extends ChangeNotifier {
  List<Exercise> exercises = [];
  final IExerciseService exerciseService;
  bool isLoading = false;

  ExercisesViewModel(this.exerciseService) {
    fetchExercisesData();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchExercisesData() async {
    changeLoading();
    // exercises = (await exerciseService.fetchExercises())?.exercise ?? [];
    changeLoading();
  }
}
