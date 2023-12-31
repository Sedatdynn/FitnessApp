import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/home/exercises/view/initial/view/initial_view.dart';
import 'package:fistness_app_firebase/feature/home/profile/view/profile_view.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List pages = [const InitialPage(), const ProfileView()];
  int selectedIndex = 0;
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: selectedIndex,
        backgroundColor: AppColors.backgroundColor.withGreen(25),
        unselectedItemColor: AppColors.darkText,
        selectedItemColor: AppColors.whiteText,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: MyText.bnFirstText,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: MyText.bnThirdText,
          ),
        ],
      ),
    );
  }
}
