// ignore_for_file: prefer_const_constructors, invalid_return_type_for_catch_error

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
    String image_path = "assets/google.png";
    String face_image_path = "assets/facebook.png";
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
                      icon: Image.asset(
                        image_path,
                        height: 27,
                      ),
                      onPressed: () {
                        loginWithGoogle();
                      },
                      label: Text(
                        registerText.googleText,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade200),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        face_image_path,
                        height: 23,
                      ),
                      onPressed: () {},
                      label: Text(
                        registerText.faceText,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff4267B2)),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none)),
                    ),
                  ),
                ],
              ),
            ),
          )
        : CircularProgressIndicator();
  }

  loginWithGoogle() {
    myText.authService.signInWithGoogle().then((value) async {
      //dynamic check_email = digerFoonks(value.user!.email);
      bool anyUid = await myText.authService.checkUid(value.user!.uid);
      if (anyUid) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
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
    }).catchError((error) => _warningToast(error));
  }

  Future<bool?> _warningToast(String text) async {
    return await Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14);
  }
}
