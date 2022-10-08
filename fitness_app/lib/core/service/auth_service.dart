import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../src/texts.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn _google = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/user.profile',
    ],
  );

  Future<Object?> signInWithEmail(String email, String password) async {
    final user = await auth
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .catchError((onError) => print("SignIn with Email error $onError"));

    if (user.user?.email != null) {
      MyText.currentUser = user;
      return user.user;
    }
    return false;
  }

  Future signOut() async {
    MyText.currentUser = null;
    await GoogleSignIn().signOut();
    await auth.signOut();
  }

  Future<DocumentSnapshot> fetchCurrentUserDoc() async {
    return await firestore
        .collection('Users')
        .doc(auth.currentUser!.uid.toString())
        .get();
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

  Future<UserCredential> signInWithGoogle() async {
    print("\n\n\n\n\n\n" + "signIn google a girdim");
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: ['email', "https://www.googleapis.com/auth/userinfo.profile"],
    ).signIn();

    print("\n\n\n\n\n\n" + "google user degiskeni" + googleUser.toString());

    // Obtain the auth details from the request
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    print("\n\n\n\n\n\n" + "googleauth degiskenii" + googleAuth.toString());
    MyText.currentUser = googleAuth;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print("\n\n\n\n\n\n" +
        "googleauth credential bilgisii -->" +
        credential.toString());

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

const String collectionName = "Users";
