import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/product/global/theme_control.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/const/const_shelf.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: context.minMidAllPadding,
        decoration: commonBoxDec(
          context.watch<ThemeNotifier>().isLight
              ? Colors.grey
              : const Color(0xFF19282F),
          context.watch<ThemeNotifier>().isLight
              ? Colors.white
              : const Color(0xFF3d444e),
          context.watch<ThemeNotifier>().isLight
              ? Colors.white
              : const Color(0xFF2c2f37),
        ),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: commonBoxDec(
                      context.watch<ThemeNotifier>().isLight
                          ? Colors.grey
                          : const Color(0xFF19282F),
                      context.watch<ThemeNotifier>().isLight
                          ? Colors.grey
                          : const Color(0xFF19282F),
                      context.watch<ThemeNotifier>().isLight
                          ? Colors.grey
                          : const Color(0xFF000000),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: context.minTopBottom,
                  child: Center(child: _buildProfileImage()),
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: commonBoxDec(
                      context.watch<ThemeNotifier>().isLight
                          ? Colors.grey
                          : const Color(0xFF19282F),
                      context.watch<ThemeNotifier>().isLight
                          ? Colors.grey
                          : const Color(0xFF19282F),
                      context.watch<ThemeNotifier>().isLight
                          ? Colors.grey
                          : const Color(0xFF000000),
                    ),
                    child: const Icon(
                      Icons.receipt_outlined,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => const LaunchPage(),
                        )));
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Sedat Dayan",
                style: context.headline6(context),
              ),
            ),
            Container(
              decoration: commonBoxDec(
                const Color(0xFF0B0B0C),
                const Color(0xFF19282F),
                const Color(0xFF000000),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ...ListTile.divideTiles(
                      color: context.mainColor,
                      tiles: [
                        ListTile(
                          contentPadding: context.symVertPadding,
                          leading: const Icon(
                            Icons.my_location,
                          ),
                          title: const Text("Location"),
                          subtitle: const Text("TR"),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.email,
                          ),
                          title: Text("Email"),
                          subtitle: Text("dayan.sedat1998@gmail.com"),
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.read<ThemeNotifier>().changeTheme(),
                          child: const ListTile(
                            leading: Icon(
                              Icons.phone,
                            ),
                            title: Text("Phone"),
                            subtitle: Text("533--*4*--4**9"),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.update,
                          ),
                          title: Text("Update"),
                          subtitle: Text("Update my information"),
                        ),
                        GestureDetector(
                          child: const ListTile(
                            leading: Icon(
                              Icons.logout,
                            ),
                            title: Text("Logout"),
                            subtitle: Text("Have a good day"),
                          ),
                          onTap: () async {
                            await deleteToken();
                            Navigator.push(
                                context,
                                (MaterialPageRoute(
                                  builder: (context) => const LaunchPage(),
                                )));
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    String imagePath =
        "https://avatars.githubusercontent.com/u/70951966?s=400&u=38f9ccae5707c0e357afed6f02ff02f2d563c58c&v=4";
    return CircleAvatar(
      backgroundImage: NetworkImage(imagePath),
      radius: 60,
    );
  }
}
