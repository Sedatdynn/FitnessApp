import 'package:fistness_app_firebase/core/service/auth_service.dart';
import 'package:fistness_app_firebase/feature/home/bottomNavigateBar/navigare_bar.dart';

import '../../product/const/const_shelf.dart';
import '../../product/const/responsive/responsive.dart';
import '../../product/extensions/extensions_shelf.dart';

import '../../product/enum/image/png/image_path.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/button/auth_button.dart';
import '../login/login_page.dart';
import '../register/register_page.dart';
import '../views_shelf.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: context.midTopBottom,
          child: Column(
            children: [
              const LogoBody(),
              _pageCenterText(context),
              SizedBox(
                height: context.dynamicHeight(0.15),
              ),
              _emailButton(context),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              _googleButton(context),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _bottomTextList(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageCenterText(BuildContext context) {
    return Text(
      MyText.fitText,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        shadows: <Shadow>[
          const Shadow(
              offset: Offset(5.0, 5.0), blurRadius: 3.0, color: AppColors.keyTextShadowColor),
          const Shadow(
              offset: Offset(5.0, 5.0), blurRadius: 8.0, color: AppColors.keyTextMainColor),
        ],
      ),
    );
  }

  Widget _emailButton(BuildContext context) {
    return AuthButton(
      buttonText: RegisterText.signEmailText,
      icon: Icon(
        Icons.email_outlined,
        color: AppColors.whiteText,
        size: context.dynamicHeight(0.04),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
  }

  Widget _googleButton(BuildContext context) {
    return AuthButton(
      color: AppColors.shadeGreyColor,
      textColor: AppColors.darkText,
      buttonText: RegisterText.googleText,
      icon: SizedBox(height: context.dynamicHeight(0.04), child: ImagePath.google.toPng(context)),
      onPressed: () async {
        bool? isSuccess = await AuthService.instance.signInWithGoogle();
        if (isSuccess) {
          if (context.mounted) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ));
          }
        }
      },
    );
  }

  List<Widget> _bottomTextList(BuildContext context) {
    return [
      _accountText(context),
      SizedBox(
        width: context.dynamicWidth(0.03),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        },
        child: _createAccountText(context),
      ),
    ];
  }

  Widget _accountText(BuildContext context) {
    return Text(
      QuestionsText.accountText,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  Widget _createAccountText(BuildContext context) {
    return Text(
      RegisterText.createText,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.mainPrimary),
    );
  }
}
