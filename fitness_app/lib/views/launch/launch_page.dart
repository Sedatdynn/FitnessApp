import 'package:fistness_app_firebase/core/const/const_shelf.dart';
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
              _signEmailButton(context, mediaQueryHeight, mediaQueryWidth),
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
        style: context.headline4(context),
      ),
    );
  }
}
