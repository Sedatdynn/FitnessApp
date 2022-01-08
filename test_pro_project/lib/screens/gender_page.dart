// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:test_pro_project/screens/age_page.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = [true, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: new Image.asset('assets/logo.png'),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Text(
                  "What is your sex?",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(16.0),
                  children: [
                    Column(
                      children: [
                        Icon(Icons.male,
                            size: MediaQuery.of(context).size.height / 6,
                            color: isSelected[0] == false
                                ? Colors.grey
                                : Colors.red.shade900),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            "Woman",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.female,
                            size: MediaQuery.of(context).size.height / 6,
                            color: isSelected[0] == true
                                ? Colors.grey
                                : Colors.blue.shade900),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            "Man",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )
                      ],
                    )
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      for (var i = 0; i < isSelected.length; i++) {
                        if (i == index) {
                          isSelected[i] = true;
                        } else {
                          isSelected[i] = false;
                        }
                      }
                    });
                  },
                  color: Colors.grey,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade900),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgeScreen()),
                        );
                      },
                      child: Text('Next'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
