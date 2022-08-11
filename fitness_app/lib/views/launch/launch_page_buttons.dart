import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

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
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.82,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton.icon(
                      icon: ImagePaths.google.googletoWidget(),
                      onPressed: () {
                        loginWithGoogle();
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
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton.icon(
                      icon: ImagePaths.facebook.facetoWidget(),
                      onPressed: () {},
                      label: Text(RegisterText.faceText,
                          style: context
                              .subtitle1(context)
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff4267B2)),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const CircularProgressIndicator();
  }

  loginWithGoogle() {
    MyText.authService.signInWithGoogle().then((value) async {
      //dynamic check_email = digerFoonks(value.user!.email);
      bool anyUid = await MyText.authService.checkUid(value.user!.uid);
      if (anyUid) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterNamePage(
                      mail: value.user!.email,
                      uid: value.user!.uid,
                      username: value.user!.displayName,
                    )),
            (route) => false);
      }
    }).catchError((error) {
      _warningToast(error);
    });
  }

  Future<bool?> _warningToast(String text) async {
    return await Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: context.mainColor,
        textColor: context.textColor,
        fontSize: 14);
  }
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
