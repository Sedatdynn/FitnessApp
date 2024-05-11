import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistness_app_firebase/core/core_shelf.dart';
import 'package:fistness_app_firebase/feature/auth/login/model/login_model.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._init();
  static AuthService? _instance;

  static AuthService? get instance {
    return _instance ??= AuthService._init();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final String userCollection = 'users';

  /// google sign out func
  Future<void> signOut() async {
    if (_googleSignIn.currentUser == null) return;
    await _auth.signOut();
    await _googleSignIn.disconnect();
  }

  /// Getting data from firestore db
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

  /// Setting user data to firestore db
  Future<void> setUser({required UserModel model}) async {
    return _firestore
        .collection(userCollection)
        .doc(_auth.currentUser!.uid)
        .set(model.toJsonWithoutPassword());
  }

  /// Update user data in firestore db
  BaseVoidData updateData({required UserModel model}) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(_auth.currentUser!.uid)
          .update(model.toJson());
      return right(null);
    } on FirebaseException catch (e) {
      return left(ServerException(message: e.message!, statusCode: '505'));
    }
  }

  /// Create user with email and password
  BaseVoidData createPerson({required UserModel model}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: model.email!, password: model.password!);

      /// save user to firestore db
      await setUser(model: model);

      /// send email verification
      await sendEmailVerified();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerException(message: e.message!, statusCode: e.code));
    } catch (e) {
      return left(ServerException(message: e.toString(), statusCode: '505'));
    }
  }

  /// send email verification
  Future<void> sendEmailVerified() async {
    final user = _auth.currentUser!;
    await user.sendEmailVerification();
  }

  /// send email to reset user's password
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

  /// Sign in with google func
  Future<bool> signInWithGoogle() async {
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          final token = googleAuth.accessToken;

          /// save user's token to cache
          await CacheManager.instance.setStringValue(CacheKeys.token, token!);
          return true;
        } on FirebaseException catch (_) {
          return false;
        }
      }
    }
    return false;
  }

  /// Sign in with email and password func
  BaseVoidData signInWithEmailAndPassword({required LoginModel model}) async {
    try {
      final credential =
          await _auth.signInWithEmailAndPassword(email: model.email!, password: model.password!);
      if (credential.user!.emailVerified) {
        final idToken = await credential.user!.getIdToken();

        /// save user's token to cache
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
