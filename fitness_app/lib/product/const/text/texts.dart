import 'dart:ui';

import 'package:fistness_app_firebase/core/service/auth_service.dart';

final class MyText {
  const MyText._();
  static final AuthService authService = AuthService();
  static const String usernameText = "User name";
  static const String bnFirstText = "Home";
  static const String bnSecondText = "Search";
  static const String bnThirdText = "Profile";
  static const String homeWelcomeText = "Good Morning ";
  static const String continueText = "continue";
  static const String nextText = "Next";
  static const String exerciseText = "Exercises";
  static const String fitText = "Fitness Is The Key";
  static dynamic currentUser;
}

class RegisterText {
  static const String registerSuccessfully = "Your registration has been completed successfully.";
  static const String verifyWarning = "We sent an email to verification. Please Verify your email.";
  static const String signEmailText = 'Sign in with Email ';
  static const String googleText = "Sign in with Google";
  static const String emailText = "Email";
  static const String verifyEmailText = "Verify Email";
  static const String faceText = "Facebook";
  static const String emailAssociated = "Enter the Email address associated with your account";
  static const String womanText = "Female";
  static const String manText = "Male";
  static const String cmText = "cm";
  static const String kgText = "kg";
  static const String orLogText = "Or log in with:";
  static const String orSignText = "Or sign-up with:";
  static const String createText = "Create Account";
  static const String passwordText = "Password";
}

class QuestionsText {
  static const String sexText = "What is your sex?";
  static const String ageText = "What is your birth of date?";
  static const String heightText = "How much is your height?";
  static const String accountText = "Don't you have an account?";
  static const String forgotPassText = "Forgot password?";
  static const String nameText = "Your Name?";
  static const String weightText = "How much is your weight?";
}

class WarningText {
  static const String registerEmptyUsername = "Username can't be empty";
  static const String registerEmptyEmail = "Mail can't be empty";
  static const String registerEmptyPassword = "Password can't be empty";
  static const String sexWarningText = "You should choice your sex!";
  static const String nameWarningText = "You should enter your name!";
  static const String loginWrongEmailText = "Invalid mail!";
  static const String loginNoAccountText = "User not found!";
  static const String loginWrongPasswordText = "Wrong password!";
  static const String errorText = "An unexpected error has occurred...";
  static const String registerInvalidPassword = "Password must be at least 6 character";
  static const String registerUniqueMail =
      "Mail is already in use! Please register with difference mail ";
}

class AllColors {
  static const Color gradColor1 = Color(0xFF19282F);
  static const Color gradColor2 = Color(0xFF3d444e);
  static const Color gradColor3 = Color(0xFF2c2f37);
  static const Color gradColor4 = Color(0xFF000000);
  static const Color gradColor5 = Color(0xFF2a2d32);
  static const Color gradColor6 = Color(0xFF4b4f5b);
}
