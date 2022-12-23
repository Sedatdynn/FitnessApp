import 'package:fistness_app_firebase/core/const/const_shelf.dart';
import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/src/texts.dart';
import 'package:fistness_app_firebase/views/height/height_page.dart';
import 'package:flutter/material.dart';

List<String> list = <String>[
  'Desk job or sedentary',
  'Both at the table and standing',
  'Those on the move during the day',
  'Active employees'
];

class DailyMobilityView extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final int? age;
  final String uid;
  const DailyMobilityView(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender,
      this.age})
      : super(key: key);
  @override
  State<DailyMobilityView> createState() => _DailyMobilityViewState();
}

class _DailyMobilityViewState extends State<DailyMobilityView> {
  String selectedValue = list.first;
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.minAllPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const LogoBody(),
            Text("Select your daily  Exercise and your Mobility",
                textAlign: TextAlign.center, style: context.headline6(context)),
            Text(selectedValue.toString(), style: context.headline4(context)),
            DropdownButton<String>(
              dropdownColor: Colors.deepPurpleAccent,
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 5,
              style: context.headline6(context),
              underline: Container(
                width: context.width,
                height: 5,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  selectedValue = value;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            CommonButton(
                text: MyText.nextText,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeightPage(
                        username: widget.username,
                        mail: widget.mail,
                        password: widget.password,
                        uid: widget.uid,
                        name: widget.name,
                        gender: widget.gender,
                        age: widget.age,
                        mobility: selectedValue,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
