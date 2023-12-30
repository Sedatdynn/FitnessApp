import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/core/base/exception/exception.dart';
import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/feature/auth/login/model/login_model.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:fistness_app_firebase/product/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
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

  BaseResponseData<dynamic> fetchCurrentUserDoc() async {
    try {
      final userInfo =
          await _firestore.collection(userCollection).doc(_auth.currentUser!.uid).get();
      if (userInfo.data() != null) {
        final user = const UserModel().fromJson(userInfo.data()!);
        return Right(user);
      } else {
        return const Right(null);
      }
    } on FirebaseException catch (e) {
      return Left(ServerException(message: e.message.toString(), statusCode: e.code));
    }
  }

  Future<void> setUser({required UserModel model}) async {
    return await _firestore
        .collection(userCollection)
        .doc(_auth.currentUser!.uid)
        .set(model.toJsonWithoutPassword());
  }

  BaseVoidData createPerson({required UserModel model}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: model.email!, password: model.password!);
      await setUser(model: model);
      await sendEmailVerified();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerException(message: e.message!, statusCode: e.code));
    } catch (e) {
      return left(ServerException(message: e.toString(), statusCode: '505'));
    }
  }

  Future sendEmailVerified() async {
    final user = _auth.currentUser!;
    await user.sendEmailVerification();
  }

  BaseVoidData resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerException(message: e.message!, statusCode: e.code));
    } catch (e) {
      return Left(ServerException(message: e.toString(), statusCode: '505'));
    }
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

  BaseVoidData signInWithEmailAndPassword({required LoginModel model}) async {
    try {
      final UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: model.email!, password: model.password!);
      if (credential.user!.emailVerified) {
        final String? idToken = await credential.user!.getIdToken();
        if (idToken != null) await CacheManager.instance.setStringValue(CacheKeys.token, idToken);
        return const Right(null);
      } else {
        return const Left(ServerException(message: 'Verify your email!', statusCode: '505'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ServerException(message: e.message!, statusCode: e.code));
    } catch (e) {
      return Left(ServerException(message: e.toString(), statusCode: '505'));
    }
  }
}
