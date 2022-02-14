// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fistness_app_firebase/views/home/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
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
                            offset: Offset(0, 2), // changes position of shadow
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
