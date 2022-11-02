import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../src/texts.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn _google = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/openid',
      'https://www.googleapis.com/auth/youtube.force-ssl'
    ],
  );

  Future signOut() async {
    MyText.currentUser = null;
    //await _google.disconnect();
    await _google.signOut();
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

  Future<UserCredential> signInWithGoogle() async {
    print("object");
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();
    print(googleUser.toString() + " <--- googleUser");

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    print(googleAuth.toString() + " <--- googleAuth");

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(credential.toString() + "0----- sdafkjasdkfsa");
    // Once signed in, return the UserCredential
    final lastAuth =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(lastAuth.toString() + "print oldu mu last auth");
    return lastAuth;
  }

//     // Obtain the auth details from the request
//     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//     print("\n\n\n\n\n\n" + "googleauth degiskenii" + googleAuth.toString());
//     MyText.currentUser = googleAuth;
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     print("\n\n\n\n\n\n" +
//         "googleauth credential bilgisii -->" +
//         credential.toString());

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
}

const String collectionName = "Users";
