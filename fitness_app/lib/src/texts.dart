import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class MyText {
  static final AuthService authService = AuthService();
  static String usernameText = "User name";
  static String bnFirstText = "Home";
  static String bnSecondText = "Search";
  static String bnThirdText = "Profile";
  static String homeWelcomeText = "Good Morning ";
  static String contiuneText = "Contiune";
  static String nextText = "Next";
  static String exerciseText = "Exercises";
  static String fitText = "Fitness Is The Key";
  static dynamic currentUser;
  MyText._();
}

class RegisterText {
  static String registerSuccesfully =
      "Your registration has been completed successfully.";
  static String signEmailText = 'Sign in with Email ';
  static String googleText = "Google";
  static String emailText = "Email";
  static String verifyEmailText = "Verify Email";
  static String faceText = "Facebook";
  static String emailAssociated =
      "Enter the Email address associated with your account";
  static String womanText = "Female";
  static String manText = "Male";
  static String cmText = "cm";
  static String kgText = "kg";
  static String orLogText = "Or log in with:";
  static String orSignText = "Or sign-up with:";
  static String createText = "Create Account";
  static String passwordText = "Password";
}

class QuestionsText {
  static String sexText = "What is your sex?";
  static String ageText = "How old are you?";
  static String heightText = "How much is your height?";
  static String accountText = "Don't you have an account?";
  static String forgotPassText = "Forgot password?";
  static String nameText = "Your Name?";
  static String weightText = "How much is your weight?";
}

class WarningText {
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

class AllColors {
  static Color gradColor1 = const Color(0xFF19282F);
  static Color gradColor2 = const Color(0xFF3d444e);
  static Color gradColor3 = const Color(0xFF2c2f37);
  static Color gradColor4 = const Color(0xFF000000);
  static Color gradColor5 = const Color(0xFF2a2d32);
  static Color gradColor6 = const Color(0xFF4b4f5b);
}
