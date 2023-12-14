import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/text/texts.dart';
import 'package:flutter/material.dart';

List<String> list = <String>[
  'Desk job or sedentary',
  'Both at the table and standing',
  'Those on the move during the day',
  'Active employees'
];

@RoutePage()
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
        padding: const AppPadding.largeAll(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const LogoBody(),
            Text("Select your daily  Exercise and your Mobility",
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge),
            Text(selectedValue.toString(), style: Theme.of(context).textTheme.displaySmall),
            DropdownButton<String>(
              dropdownColor: Colors.deepPurpleAccent,
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 5,
              style: Theme.of(context).textTheme.titleLarge,
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
                  RouteManager.instance.push(HeightRoute(
                    username: widget.username,
                    mail: widget.mail,
                    password: widget.password,
                    uid: widget.uid,
                    name: widget.name,
                    gender: widget.gender,
                    age: widget.age,
                    mobility: selectedValue,
                  ));
                })
          ],
        ),
      ),
    );
  }
}
