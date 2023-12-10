import 'package:auto_route/auto_route.dart';

import '../../../product/theme/colors.dart';
import '../../exercises/view/initial/initial_page.dart';
import '../../profile/profile_page.dart';
import '../../views_shelf.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [const InitialPage(), const ProfilePage()];
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
