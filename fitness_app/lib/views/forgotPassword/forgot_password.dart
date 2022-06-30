// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fistness_app_firebase/views/views_shelf.dart';

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
          padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 5.0),
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _logoBody(),
              SizedBox(
                height: 40,
              ),
              _forgotText(),
              SizedBox(
                height: 30,
              ),
              _emailTextfield(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
      style: TextStyle(color: Colors.white),
      controller: _emailController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.red.shade900,
          ),
          hintText: registerText.emailText,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900),
              borderRadius: BorderRadius.circular(10))),
    );
  }

  _logoBody() {
    String image_path = "assets/logo.png";
    return Container(
      height: 200,
      child: Image.asset(image_path),
      alignment: Alignment.center,
    );
  }

  myButton() {
    Size mediaQuery = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: mediaQuery.height * 0.06,
        width: mediaQuery.width * 0.81,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
          ),
          onPressed: () {},
          child: Text(registerText.verifyEmailText,
              style: TextStyle(color: Colors.white, fontSize: 18.0)),
        ),
      ),
    );
  }

  _forgotText() {
    return Column(
      children: [
        Center(
          child: Text(
            questionsText.forgotPassText,
            style: TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          registerText.emailAssociated,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ],
    );
  }
}
