import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static AuthService? _instance;
  static AuthService get instance {
    _instance ??= AuthService._init();
    return _instance!;
  }

  AuthService._init();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final String userCollection = "users";

  Future<void> signOut() async {
    if (_googleSignIn.currentUser == null) return;
    await _auth.signOut();
    await _googleSignIn.disconnect();
    _auth.currentUser == null;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchCurrentUserDoc() async {
    return await _firestore.collection(userCollection).doc(_auth.currentUser!.uid).get();
  }

  Future<bool?> createPerson({required String uid, required UserModel model}) async {
    await _auth.createUserWithEmailAndPassword(email: model.email!, password: model.password!);
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
    await _firestore.collection(userCollection).doc(_auth.currentUser!.uid).set(userInfo.toJson());
    return true;
  }

  Future sendEmailVerified() async {
    final user = _auth.currentUser!;
    await user.sendEmailVerification();
  }

  // void checkUid() {
  //   final User? userr = FirebaseAuth.instance.currentUser;
  //   final uid = userr?.uid;
  //   return null;
  // }

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        try {
          await _auth.signInWithCredential(GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
          final String? token = googleAuth.accessToken;
          prefs.setString("token", token!);
          return true;
        } on FirebaseException catch (_) {
          return false;
        }
      }
    }
    return false;
  }

  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        final String? idToken = await credential.user!.getIdToken();
        if (idToken != null) {
          prefs.setString("token", idToken);
        }
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }
}
