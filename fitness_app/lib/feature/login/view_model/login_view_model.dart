import 'package:fistness_app_firebase/feature/views_shelf.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = true;
  bool isLoading = false;

  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
