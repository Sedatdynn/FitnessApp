// ignore_for_file: unused_field, unused_local_variable, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return user.user;
  }

  Future signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(
      String username,
      String email,
      String password,
      String name,
      String gender,
      String age,
      String length,
      String weight) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection(collection_name).doc(user.user?.uid ?? "").set({
      "username": username,
      "email": email,
      "name": name,
      "gender": gender,
      "age": age,
      "length": length,
      "weight": weight,
    });
    return user.user;
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
