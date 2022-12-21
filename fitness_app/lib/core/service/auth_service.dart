import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/views/home/bottomNavigateBar/navigare_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../src/texts.dart';
import '../../views/home/view/home_page.dart';
import '../../views/views_shelf.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  Future signOut() async {
    final _google = GoogleSignIn();

    MyText.currentUser = null;
    await _google.disconnect();
    await _google.signOut();
    await auth.signOut();
  }

  Future<DocumentSnapshot> fetchCurrentUserDoc() async {
    return await firestore
        .collection('Users')
        .doc(auth.currentUser!.email.toString())
        .get();
  }

  Future<bool?> createPerson(
      String username,
      String email,
      String password,
      String uid,
      String name,
      String gender,
      String age,
      String length,
      String weight) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final userInfo = <String, String>{
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age,
      "length": length,
      "weight": weight,
    };
    await firestore.collection(collectionName).doc(uid).set(userInfo);
    return true;
  }

  Future<bool?> createPersonEmail(
      String username,
      String email,
      String password,
      String uid,
      String name,
      String gender,
      String age,
      String length,
      String weight) async {
    //dynamic user = await auth.createUserWithEmailAndPassword(
    //    email: email, password: password);

    await firestore.collection(collectionName).doc(uid).set({
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age,
      "length": length,
      "weight": weight,
    }).catchError((error) => print("Failed to set data: $error"));
    return true;
  }

  Future<bool> checkUid(String? uid) async {
    try {
      dynamic user =
          await firestore.collection(collectionName).doc(uid.toString()).get();
      if (user.exists) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      return false;
    }
  }

  Future<void> signInWithGoogle(context) async {
    final _google = GoogleSignIn();

    final googleAccount = await _google.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await auth.signInWithCredential(GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ));
        } on FirebaseException catch (e) {
          print(e);
        }
      }
    }
//     // Obtain the auth details from the request
  }

  String collectionName = "Users";
}
 //print("object");
  //   // Trigger the authentication flow
  //   final googleUser = await GoogleSignIn().signIn();
  //   print(googleUser.toString() + " <--- googleUser");

  //   // Obtain the auth details from the request
  //   final googleAuth = await googleUser?.authentication;

  //   print(googleAuth.toString() + " <--- googleAuth");

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   print(credential.toString() + "0----- sdafkjasdkfsa");
  //   // Once signed in, return the UserCredential
  //   final lastAuth =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   print(lastAuth.toString() + "print oldu mu last auth");
  //   return lastAuth;
  // }
