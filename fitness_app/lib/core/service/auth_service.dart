import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/home/bottomNavigateBar/navigare_bar.dart';
import '../../feature/views_shelf.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionName = "users";
  bool isLoading = false;

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    print(googleSignIn.currentUser);
    if (googleSignIn.currentUser != null) {
      print(googleSignIn.currentUser);
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } else {
      print('ELSE NULLLLLLLLLLLL');

      await FirebaseAuth.instance.signOut();
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.currentUser == null;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchCurrentUserDoc() async {
    return await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).get();
  }

  Future<bool?> createPerson(String uid, UserModel model) async {
    await auth.createUserWithEmailAndPassword(email: model.email!, password: model.password!);
    final userInfo = UserModel(
        username: model.username,
        email: model.email,
        name: model.name,
        password: '',
        gender: model.gender,
        age: model.age,
        mobility: model.mobility,
        height: model.height,
        weight: model.weight,
        userRightPoint: model.userRightPoint);
    await firestore.collection("users").doc(auth.currentUser!.uid).set(userInfo.toJson());
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
        SharedPreferences prefs = await SharedPreferences.getInstance();

        try {
          await auth.signInWithCredential(GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
          final token = googleAuth.accessToken;
          prefs.setString("token", token!);
          //TODO: check google currentUser when signout func called it comes null
          print('********************************');
          print(_google.currentUser);
          print('********************************');
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
  }

  Future<bool> signInWithEmailandPassword(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.emailVerified) {
        final idToken = await credential.user!.getIdToken();
        if (idToken != null) {
          prefs.setString("token", idToken);
        }
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
