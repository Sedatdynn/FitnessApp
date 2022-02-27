// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fistness_app_firebase/services/auth_service.dart';
import 'package:fistness_app_firebase/views/home/home_page.dart';
import 'package:fistness_app_firebase/views/launch/launch_page.dart';
import 'package:flutter/material.dart';
import 'package:fistness_app_firebase/src/texts.dart';

class DrawerMenu extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? uid;

  final String? name;
  final String? gender;
  final String? age;
  final String? height;
  final String? weight;

  const DrawerMenu(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender,
      this.age,
      this.height,
      this.weight})
      : super(key: key);

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
              widget.name.toString(),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  username: widget.username,
                                  mail: widget.mail,
                                  password: widget.password,
                                  uid: widget.uid.toString(),
                                  name: widget.name,
                                  gender: widget.gender,
                                  age: widget.age,
                                  height: widget.height,
                                  weight: widget.weight,
                                )));
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
                        MaterialPageRoute(
                            builder: (context) => LaunchPage(
                                  username: widget.username,
                                  mail: widget.mail,
                                  password: widget.password,
                                  uid: widget.uid,
                                  name: widget.name,
                                  gender: widget.gender,
                                  age: widget.age,
                                  height: widget.height,
                                  weight: widget.weight,
                                )),
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
