// ignore_for_file: avoid_print, use_build_context_synchronously, dead_code

import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';

import '../views_shelf.dart';

class LaunchPageButtons extends StatefulWidget {
  const LaunchPageButtons({
    Key? key,
  }) : super(key: key);

  @override
  _LaunchPageButtonsState createState() => _LaunchPageButtonsState();
}

class _LaunchPageButtonsState extends State<LaunchPageButtons> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Center(
            child: SizedBox(
              height: context.height * 0.06,
              width: context.width * 0.8,
              child: SizedBox(
                height: context.height * 0.06,
                width: context.width * 0.4,
                child: OutlinedButton.icon(
                  icon: ImagePaths.google.googletoWidget(),
                  onPressed: () async {
                    // MyText.currentUser =
                    await MyText.authService.signInWithGoogle(context);

                    // bool isUidExist = MyText.currentUser != null;

                    // isUidExist
                    //     ? Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const HomePage()),
                    //         (route) => false)
                    //     : Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => RegisterNamePage(
                    //                   mail: MyText.currentUser.user?.email,
                    //                   uid: MyText.currentUser.user?.uid,
                    //                   username:
                    //                       MyText.currentUser.user?.displayName,
                    //                 )),
                    //         (route) => false);
                  },
                  label: Text(
                    RegisterText.googleText,
                    style: context.subtitle1(context)?.copyWith(
                        color: context.scndTxtColor,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          context.shadeGreyColor),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide.none)),
                ),
              ),
            ),
          )
        : const CircularProgressIndicator();
  }

  // Future loginWithGoogle() async {
  //   await MyText.authService.signInWithGoogle(context);
  //   bool isUidExist =
  //       await MyText.authService.checkUid(MyText.currentUser.user?.uid);

  //   isUidExist
  //       ? Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => const HomePage()),
  //           (route) => false)
  //       : Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => RegisterNamePage(
  //                     mail: MyText.currentUser.user?.email,
  //                     uid: MyText.currentUser.user?.uid,
  //                     username: MyText.currentUser.user?.displayName,
  //                   )),
  //           (route) => false);
  // }
}

enum ImagePaths { google, facebook }

extension ImageExtension on ImagePaths {
  String googlePath() {
    return "assets/${ImagePaths.google.name}.png";
  }

  String facePath() {
    return "assets/${ImagePaths.facebook.name}.png";
  }

  Widget facetoWidget() {
    return Image.asset(
      facePath(),
      height: 23,
    ); //
  }

  Widget googletoWidget() {
    return Image.asset(
      googlePath(),
      height: 23,
    ); //
  }
}
