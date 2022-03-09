// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:fistness_app_firebase/views/home/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("FİTNESS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
                height: height / 3.3,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: Colors.red.shade900)
                  ],
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFFE53936),
                        const Color(0xFFFF9F45),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16.0),
                      child: Text(
                        "Good Morning Sedat ",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Hero(
                                tag: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                      "https://image.shutterstock.com/image-vector/vector-illustration-bodybuilder-muscular-arm-260nw-1464554840.jpg",
                                      fit: BoxFit.cover,
                                      height: 70.0,
                                      width: 70.0),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("25",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Normal",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text("Kg: 85",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Age: 22",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Tall: 193",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0)),
                          ],
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 2),
                                  blurRadius: 10,
                                  color: Colors.red.shade700)
                            ],
                          ),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
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
