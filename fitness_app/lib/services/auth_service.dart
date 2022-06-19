// ignore_for_file: unused_field, unused_local_variable, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _google = GoogleSignIn();

  Future<User?> signInWithEmail(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email.trim(), password: password);

    return user.user;
  }

  Future signOut() async {
    if (_google.currentUser.toString().length < 5) {
      _google.disconnect();
    }
    await _auth.signOut();
  }

  Future<bool?> createPerson(
      String username,
      String email,
      //String password,
      String uid,
      String name,
      String gender,
      String age,
      String length,
      String weight) async {
    //var user = await _auth.createUserWithEmailAndPassword(
    //    email: email, password: password);

    await _firestore.collection(collection_name).doc(uid).set({
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age,
      "length": length,
      "weight": weight,
    });
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
    dynamic user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection(collection_name).doc(user.user!.uid).set({
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age,
      "length": length,
      "weight": weight,
    });
    return true;
  }

  Future<bool> checkUid(String? uid) async {
    dynamic user =
        await _firestore.collection(collection_name).doc(uid.toString()).get();
    if (user.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

const String collection_name = "Users";
