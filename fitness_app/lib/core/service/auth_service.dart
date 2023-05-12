import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../feature/home/bottomNavigateBar/navigare_bar.dart';
import '../../feature/views_shelf.dart';
import '../../product/const/text/texts.dart';

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
    if (googleSignIn.currentUser != null) {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } else {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.currentUser == null;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchCurrentUserDoc() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
  }

  Future<bool?> createPerson(
      String username,
      String email,
      String password,
      String uid,
      String name,
      String gender,
      int age,
      String mobility,
      int height,
      int weight,
      int userRightPoint) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final userInfo = <String, String>{
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age.toString(),
      "mobility": mobility,
      "height": height.toString(),
      "weight": weight.toString(),
      "userRightPoint": userRightPoint.toString()
    };
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(userInfo);
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
      String height,
      String weight) async {
    await firestore.collection(collectionName).doc(uid).set({
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age,
      "height": height,
      "weight": weight,
    }).catchError((error) => print("Failed to set data: $error"));
    return true;
  }

  Future sendEmailVerfied() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  }

  void checkUid() {
    final User? userr = FirebaseAuth.instance.currentUser;
    final uid = userr?.uid;
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
          await Navigator.push(
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
      if (credential.user!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
