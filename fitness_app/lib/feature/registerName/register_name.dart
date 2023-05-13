import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';

import '../../product/const/const_shelf.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../gender/gender.dart';
import '../views_shelf.dart';

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
                height: context.height * 0.01,
              ),
              _nameField(),
              SizedBox(
                height: context.height * 0.3,
              ),
              CommonButton(text: MyText.nextText, onPressed: _registerOnTap)
            ],
          ),
        ),
      ),
    );
  }

  myText() {
    return SizedBox(
        height: context.height * 0.09,
        width: context.width * 0.87,
        child: ConstText(
          text: QuestionsText.nameText,
        ));
  }

  _nameField() {
    return TextField(
        style: Theme.of(context).textTheme.titleLarge,
        controller: _nameController,
        cursorColor: AppColors.whiteText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: QuestionsText.nameText,
          hintStyle: Theme.of(context).textTheme.titleLarge,
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
