import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/core/const/const_shelf.dart';
import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_page.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateInfosView extends StatefulWidget {
  const UpdateInfosView({Key? key}) : super(key: key);
  @override
  State<UpdateInfosView> createState() => _UpdateInfosViewState();
}

class _UpdateInfosViewState extends State<UpdateInfosView> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController mobilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: MyText.authService.fetchCurrentUserDoc(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            if (snapshot.hasData) {
              return Padding(
                padding: context.minAllPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      controller: weightController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelText: "weight -> ${snapshot.data?["weight"]}"),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      controller: heightController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelText: "height -> ${snapshot.data?["height"]}"),
                    ),
                    CommonButton(
                        text: "Update",
                        onPressed: () {
                          Map<String, String> dataToUpdate = {
                            "weight": (weightController.text.isNotEmpty)
                                ? weightController.text
                                : snapshot.data?["weight"],
                            "height": (heightController.text.isNotEmpty)
                                ? heightController.text
                                : snapshot.data?["height"],
                          };
                          CollectionReference collection =
                              FirebaseFirestore.instance.collection("users");
                          DocumentReference doc = collection
                              .doc(FirebaseAuth.instance.currentUser!.uid);
                          doc.update(dataToUpdate);
                          warningToast(
                              context, "Your update completed successfully",
                              color: context.greenColor);
                          Future.delayed(Duration(seconds: 2));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BmiCalculator(),
                              ));
                        })
                  ],
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
