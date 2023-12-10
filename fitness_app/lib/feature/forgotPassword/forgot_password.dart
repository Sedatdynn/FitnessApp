import 'package:auto_route/auto_route.dart';

import '../../product/const/const_shelf.dart';
import '../../product/extensions/extensions_shelf.dart';

import '../../product/theme/colors.dart';
import '../service/foods_service.dart';
import '../../core/init/network/project_network.dart';
import '../views_shelf.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => AutoRouter.of(context).pop(),
        ),
      ),
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.minLargeLtrb,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bodyContainer(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }

  Flexible _bodyContainer() {
    return Flexible(
        child: Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Padding(
        padding: context.largeAllPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const LogoBody(),
              const SizedBox(
                height: 40,
              ),
              _forgotText(),
              const SizedBox(
                height: 30,
              ),
              _emailTextfield(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 40,
              ),
              myButton(),
            ],
          ),
        ),
      ),
    ));
  }

  TextField _emailTextfield() {
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      controller: _emailController,
      cursorColor: AppColors.whiteText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail, color: AppColors.mainPrimary),
          hintText: RegisterText.emailText,
          hintStyle: Theme.of(context).textTheme.titleSmall),
    );
  }

  myButton() {
    return Center(
      child: SizedBox(
        height: context.height * 0.06,
        width: context.width * 0.81,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            foregroundColor: MaterialStateProperty.all<Color>(AppColors.whiteText),
            backgroundColor: MaterialStateProperty.all(AppColors.mainPrimary),
          ),
          onPressed: () async {
            final response =
                await FoodsService(ProjectNetworkManager.instance.service, "reset password")
                    .resetPasswordLink(_emailController.text);
            if (response!) {
              await warningToast(context, "Reset password email has been sent",
                  color: AppColors.green);
            } else {
              await warningToast(
                context,
                "Reset password email couldnt sent please try again ",
              );
            }
          },
          child: Text(RegisterText.verifyEmailText, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }

  _forgotText() {
    return Column(
      children: [
        Center(
          child: Text(
            QuestionsText.forgotPassText,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.darkText),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          RegisterText.emailAssociated,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
