import '../../product/const/warning_toast.dart';
import '../../product/extensions/extensions_shelf.dart';

import '../../product/const/const_logo_body.dart';
import '../service/foods_service.dart';
import '../../core/init/network/project_network.dart';
import '../views_shelf.dart';

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
          onPressed: () => Navigator.of(context).pop(),
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
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
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
      style: context.subtitle1(context),
      controller: _emailController,
      cursorColor: context.textColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: context.mainColor),
        hintText: RegisterText.emailText,
        hintStyle: context.subtitle1(context),
      ),
    );
  }

  myButton() {
    return Center(
      child: SizedBox(
        height: context.height * 0.06,
        width: context.width * 0.81,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            foregroundColor:
                MaterialStateProperty.all<Color>(context.textColor),
            backgroundColor: MaterialStateProperty.all(context.mainColor),
          ),
          onPressed: () async {
            final response = await FoodsService(
                    ProjectNetworkManager.instance.service, "reset password")
                .resetPasswordLink(_emailController.text);
            if (response!) {
              await warningToast(context, "Reset password email has been sent",
                  color: context.greenColor);
            } else {
              await warningToast(
                context,
                "Reset password email couldnt sent please try again ",
              );
            }
          },
          child: Text(RegisterText.verifyEmailText,
              style: context.headline6(context)),
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
            style: context.headline4(context)?.copyWith(
                fontWeight: FontWeight.bold, color: context.scndTxtColor),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          RegisterText.emailAssociated,
          textAlign: TextAlign.center,
          style: context.subtitle2(context),
        )
      ],
    );
  }
}
