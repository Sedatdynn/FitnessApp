// ignore_for_file: camel_case_types

import 'package:fistness_app_firebase/services/auth_service.dart';

class myText {
  static final AuthService authService = AuthService();
  static String usernameText = "User name";
  static String bnFirstText = "Home";
  static String bnSecondText = "Search";
  static String bnThirdText = "Profile";
  static String homeWelcomeText = "Good Morning Sedat Dayan ";
  static String contiuneText = "Contiune";
  static String nextText = "Next";
  static String exerciseText = "Exercises";
  static String fitText = "Fitness Is The Key";
  myText._();
}

class registerText {
  static String registerSuccesfully =
      "Your registration has been completed successfully.";
  static String signEmailText = 'Sign in with Email ';
  static String googleText = "Google";
  static String emailText = "Email";
  static String verifyEmailText = "Verify Email";
  static String faceText = "Facebook";
  static String emailAssociated =
      "Enter the Email address associated with your account";
  static String womanText = "Woman";
  static String manText = "Man";
  static String cmText = "cm";
  static String kgText = "kg";
  static String orLogText = "Or log in with:";
  static String orSignText = "Or sign-up with:";
  static String createText = "Create Account";
  static String passwordText = "Password";
}

class questionsText {
  static String sexText = "What is your sex?";
  static String ageText = "How old are you?";
  static String heightText = "How much is your length?";
  static String accountText = "Don't you have an account?";
  static String forgotPassText = "Forgot password?";
  static String nameText = "Your Name?";
  static String weightText = "How much is your weight?";
}

class warningText {
  static String registerEmptyUsername = "Username can't be empty";
  static String registerEmptyEmail = "Mail can't be emoty";
  static String registerEmptyPassword = "Password can't be empty";
  static String sexWarningText = "You should choice your sex!";
  static String nameWarningText = "You should enter your name!";
  static String loginWrongEmailText = "Invalid mail!";
  static String loginNoAccountText = "User not found!";
  static String loginWrongPasswordText = "Wrong password!";
  static String errorText = "An unexpected error has occurred...";
  static String registerUnvalidPassword =
      "Password must be at least 6 character";
  static String registerUniqueMail =
      "Mail is already in use! Please register with difference mail ";
}
