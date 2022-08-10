import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: context.minMidAllPadding,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 1),
              blurRadius: 20,
              color: Color(0xFF19282F),
            )
          ],
          gradient: LinearGradient(
              colors: [
                Color(0xFF3d444e),
                Color(0xFF2c2f37),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(5, 1),
                          blurRadius: 20,
                          color: Color(0xFF19282F),
                        )
                      ],
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF19282F),
                            Color(0xFF000000),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFC4FB6D),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(5, 1),
                          blurRadius: 20,
                          color: Color(0xFF19282F),
                        )
                      ],
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF19282F),
                            Color(0xFF000000),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: const Icon(
                      Icons.receipt_outlined,
                      color: Color(0xFFC4FB6D),
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
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.textColor),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(5, 1),
                      blurRadius: 20,
                      color: Color(0xFF0B0B0C))
                ],
                gradient: const LinearGradient(
                    colors: [
                      Color(0xFF19282F),
                      Color(0xFF000000),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
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
                          leading: const Icon(Icons.my_location,
                              color: Color(0xFFC4FB6D)),
                          title: const Text("Location"),
                          subtitle: const Text("TR"),
                          textColor: context.textColor,
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.email, color: Color(0xFFC4FB6D)),
                          title: const Text("Email"),
                          subtitle: const Text("dayan.sedat1998@gmail.com"),
                          textColor: context.textColor,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.phone,
                            color: Color(0xFFC4FB6D),
                          ),
                          title: const Text("Phone"),
                          subtitle: const Text("533--*4*--4**9"),
                          textColor: context.textColor,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.update,
                            color: Color(0xFFC4FB6D),
                          ),
                          title: const Text("Update"),
                          subtitle: const Text("Update my information"),
                          textColor: context.textColor,
                        ),
                        GestureDetector(
                          child: ListTile(
                            leading: const Icon(Icons.logout,
                                color: Color(0xFFC4FB6D)),
                            title: const Text("Logout"),
                            subtitle: const Text("Have a good day"),
                            textColor: context.textColor,
                          ),
                          onTap: () async {
                            await MyText.authService.signOut();
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
