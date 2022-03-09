// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fistness_app_firebase/views/home/home_page.dart';
import 'package:fistness_app_firebase/views/launch/launch_page.dart';
import 'package:flutter/material.dart';
import 'package:fistness_app_firebase/src/texts.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Sedat Dayan",
              style: TextStyle(fontSize: 16.0),
            ),
            accountEmail: Text("sedatdayan@gmail.com"),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://www.freeiconspng.com/uploads/profile-icon-9.png"),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "Homepage",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.search),
                  title: Text(
                    "Search",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    myText.authService.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LaunchPage()),
                        (route) => false);
                  },
                  child: ListTile(
                    leading: Icon(Icons.golf_course),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
