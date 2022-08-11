import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({
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

    String imagePath = "assets/logo.png";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: context.midTopBottom,
              decoration: const BoxDecoration(),
              height: 200,
              child: Image.asset(imagePath),
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                MyText.fitText,
                style: context.headline4(context),
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
                        backgroundColor: context.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      icon: Icon(
                        Icons.email_outlined,
                        color: context.textColor,
                      ),
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          RegisterText.signEmailText,
                          style: context.subtitle1(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: context.largeHorizontalPadding,
              child: Text(
                RegisterText.orLogText,
                textAlign: TextAlign.left,
                style: context
                    .bdSmall(context)
                    ?.copyWith(color: context.textColor),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const LaunchPageButtons(),
            const SizedBox(
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
                    QuestionsText.accountText,
                    style: context.subtitle2(context),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      RegisterText.createText,
                      style: context
                          .bdSmall(context)
                          ?.copyWith(color: context.mainColor),
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
