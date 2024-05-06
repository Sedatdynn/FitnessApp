import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/home/initial/view/initial_view.dart';
import 'package:fistness_app_firebase/feature/home/profile/view/profile_view.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with BottomNavigateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: selectedIndex,
        items: bottomNavigationItems,
      ),
    );
  }
}

mixin BottomNavigateMixin on State<MainView> {
  List pages = [const InitialView(), const ProfileView()];
  int selectedIndex = 0;

  //setting the selected index
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

// 2 Bottom navigation bar item
  List<BottomNavigationBarItem> bottomNavigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: MyText.bnFirstText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
      ),
      label: MyText.bnThirdText,
    ),
  ];
}
