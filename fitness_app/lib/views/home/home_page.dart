// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:fistness_app_firebase/views/home/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final String? age;
  final String? height;
  final String? weight;

  final String uid;
  HomePage(
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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(
        username: widget.username,
        mail: widget.mail,
        password: widget.password,
        uid: widget.uid,
        name: widget.name,
        gender: widget.gender,
        age: widget.age,
        height: widget.height,
        weight: widget.weight,
      ),
      appBar: AppBar(
        title: Text("FİTNESS"),
      ),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 18.0),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.grey.shade300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(children: [
                          Hero(
                              tag: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                    "https://image.shutterstock.com/image-vector/vector-illustration-bodybuilder-muscular-arm-260nw-1464554840.jpg",
                                    fit: BoxFit.cover,
                                    height: 75.0,
                                    width: 75.0),
                              )),
                          SizedBox(width: 10.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("EGZERSİZLER",
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold)),
                                Text("HELLLO",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey))
                              ])
                        ]),
                        IconButton(
                            icon: Icon(
                              Icons.arrow_right_outlined,
                              size: 30,
                            ),
                            color: Colors.black,
                            onPressed: () {})
                      ],
                    ),
                  )))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
