import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/core/const/const_shelf.dart';
import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import 'package:flutter/material.dart';

class UpdateInfosView extends StatefulWidget {
  const UpdateInfosView({Key? key}) : super(key: key);
  @override
  State<UpdateInfosView> createState() => _UpdateInfosViewState();
}

class _UpdateInfosViewState extends State<UpdateInfosView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
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
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      // validator: (value) =>
                      //     (value ?? "").length > 10 ? null : "11'den kucuk",
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelText:
                              "username -> ${snapshot.data?["username"]}"),
                    ),
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
                          labelText: "length -> ${snapshot.data?["length"]}"),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      controller: ageController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          labelText: "age -> ${snapshot.data?["age"]}"),
                    ),
                    CommonButton(
                        text: "Update",
                        onPressed: () {
                          Map<String, String> dataToUpdate = {
                            "username": usernameController.text,
                            "weight": weightController.text,
                            "length": heightController.text,
                            "age": ageController.text,
                          };
                          CollectionReference collection =
                              FirebaseFirestore.instance.collection("users");
                          DocumentReference doc = collection
                              .doc(FirebaseAuth.instance.currentUser!.uid);
                          doc.update(dataToUpdate);
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
