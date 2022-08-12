import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';

import '../../core/const/const_shelf.dart';

import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

import '../../core/const/warning_toast.dart';

class RegisterNamePage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? uid;

  const RegisterNamePage(
      {Key? key, this.username, this.mail, this.password, this.uid})
      : super(key: key);

  @override
  _RegisterNamePageState createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterNamePage> {
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: context.xLargeLtrb,
        child: SingleChildScrollView(
          child: Column(
            children: [
              myText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              _nameField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              CommonButton(text: MyText.nextText, onPressed: _registerOnTap)
            ],
          ),
        ),
      ),
    );
  }

  myText() {
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
        height: mediaQuery.height * 0.09,
        width: mediaQuery.width * 0.87,
        child: ConstText(
          text: QuestionsText.nameText,
        ));
  }

  _nameField() {
    return TextField(
        style: context.subtitle1(context),
        controller: _nameController,
        cursorColor: context.textColor,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: QuestionsText.nameText,
          hintStyle: context.headline6(context),
        ));
  }

  void _registerOnTap() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GenderPage(
                    username: widget.username,
                    mail: widget.mail,
                    uid: widget.uid.toString(),
                    password: widget.password,
                    name: _nameController.text,
                  )));
    } else {
      warningToast(context, WarningText.nameWarningText);
    }
  }
}
