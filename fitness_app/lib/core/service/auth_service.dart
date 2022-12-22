import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/views/home/bottomNavigateBar/navigare_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../src/texts.dart';
import '../../views/home/view/home_page.dart';
import '../../views/views_shelf.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionName = "users";
  bool isLoading = false;

  Future signOut() async {
    final _google = GoogleSignIn();
    await _google.disconnect();
    await _google.signOut();
    await auth.signOut();
  }

  Future<void> SignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //MyText.currentUser = null;
    if (googleSignIn.currentUser != null) {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } else {
      await FirebaseAuth.instance.signOut();
    }
  }

  Future<void> fetchCurrentUserDoc() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["age"]);
      });
    });
    // .doc()
    // .get()
    // .then((DocumentSnapshot doc) => print("+++++++++++++ ${doc.data()}"));
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
    await firestore.collection("users").doc(uid).set(userInfo);
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

  void checkUid() {
    final User? userr = FirebaseAuth.instance.currentUser;
    final uid = userr?.uid;
    print(" -------------${userr}");

    print("*********" + uid.toString());
    // try {
    //   dynamic user =
    //       await firestore.collection(collectionName).doc(uid.toString()).get();
    //   if (user.exists) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } catch (err) {
    //   return false;
    // }
    return null;
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

  Future<bool> signInWithEmailandPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
