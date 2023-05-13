import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';

import '../login/login_page.dart';
import '../register/register_page.dart';
import '../views_shelf.dart';
import 'launch_page_buttons.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: context.midTopBottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoBody(),
              const SizedBox(
                height: 15,
              ),
              _headText(context),
              _signEmailButton(context, context.height, context.width),
              const SizedBox(
                height: 25,
              ),
              _orText(context),
              const SizedBox(
                height: 10.0,
              ),
              const LaunchPageButtons(),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: context.largeHorizontalPadding,
                child: _bottomText(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _bottomText(BuildContext context) {
    return Row(
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
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: Text(
            RegisterText.createText,
            style: context.bdSmall(context)?.copyWith(color: context.mainColor),
          ),
        ),
      ],
    );
  }

  Padding _orText(BuildContext context) {
    return Padding(
      padding: context.largeHorizontalPadding,
      child: Text(
        RegisterText.orLogText,
        textAlign: TextAlign.left,
        style: context.bdSmall(context)?.copyWith(color: context.textColor),
      ),
    );
  }

  Column _signEmailButton(
      BuildContext context, double mediaQueryHeight, double mediaQueryWidth) {
    return Column(
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
                  MaterialPageRoute(builder: (context) => const LoginPage()),
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
    );
  }

  Center _headText(BuildContext context) {
    return Center(
      child: Text(
        MyText.fitText,
        style: context.headline4(context)?.copyWith(
          shadows: <Shadow>[
            const Shadow(
              offset: Offset(5.0, 5.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 187, 175, 175),
            ),
            const Shadow(
              offset: Offset(5.0, 5.0),
              blurRadius: 8.0,
              color: Color.fromARGB(124, 190, 13, 134),
            ),
          ],
        ),
      ),
    );
  }
}
