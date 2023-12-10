import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<bool?> createPerson({required UserModel model}) async {
    await _auth.createUserWithEmailAndPassword(email: model.email!, password: model.password!);
    await _firestore
        .collection(userCollection)
        .doc(_auth.currentUser!.uid)
        .set(model.toJsonWithoutPassword());
    return true;
  }

  Future sendEmailVerified() async {
    final user = _auth.currentUser!;
    await user.sendEmailVerification();
  }

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await _auth.signInWithCredential(GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
          final String? token = googleAuth.accessToken;
          await CacheManager.instance.setStringValue(CacheKeys.token, token!);
          return true;
        } on FirebaseException catch (_) {
          return false;
        }
      }
    }
    return false;
  }

  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        final String? idToken = await credential.user!.getIdToken();
        if (idToken != null) {
          await CacheManager.instance.setStringValue(CacheKeys.token, idToken);
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
