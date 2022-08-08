// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print, dead_code, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:fistness_app_firebase/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({
    Key? key,
  }) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;

    String image_path = "assets/logo.png";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: context.midTopBottom,
              decoration: BoxDecoration(),
              height: 200,
              child: Image.asset(image_path),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                myText.fitText,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: context.midTop,
                    height: mediaQueryHeight * 0.06,
                    width: mediaQueryWidth * 0.8,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        textStyle: TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          registerText.signEmailText,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: context.largeHorizontalPadding,
              child: Text(
                registerText.orLogText,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            LaunchPageButtons(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: context.largeHorizontalPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Text(
                    questionsText.accountText,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      registerText.createText,
                      style:
                          TextStyle(color: Colors.red.shade900, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
