import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/home/initial/view/initial_view.dart';
import 'package:fistness_app_firebase/feature/home/profile/view/profile_view.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';

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
      //Localizations.override for updating the language bottom navigation wasn't working
      bottomNavigationBar: Localizations.override(
        locale: context.locale,
        context: context,
        child: BottomNavigationBar(
          onTap: changeIndex,
          currentIndex: selectedIndex,
          // 2 Bottom navigation bar item
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: LocaleKeys.bnFirstText.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle,
              ),
              label: LocaleKeys.bnThirdText.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

mixin BottomNavigateMixin on State<MainView> {
  List<Widget> pages = [const InitialView(), const ProfileView()];
  int selectedIndex = 0;

  //setting the selected index
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
