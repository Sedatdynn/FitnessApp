import 'package:fistness_app_firebase/core/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';

import 'package:fistness_app_firebase/views/views_shelf.dart';

import '../../core/const/const_shelf.dart';
import '../../core/service/auth_service.dart';

class GenderPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String uid;
  const GenderPage(
      {Key? key,
      this.username,
      this.mail,
      this.name,
      this.password,
      required this.uid})
      : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  late List<bool> isSelected;
  bool isLoading = false;
  final AuthService authService = AuthService();
  var choice = "";

  @override
  void initState() {
    super.initState();
    isSelected = [true, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: context.minLtrb,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const LogoBody(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                ),
                ConstText(
                  text: QuestionsText.sexText,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                _toggleButton(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CommonButton(
                  text: MyText.contiuneText,
                  onPressed: _registerOnTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _toggleButton() {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(16.0),
      children: [
        Column(
          children: [
            Icon(Icons.male,
                size: MediaQuery.of(context).size.height / 6,
                color: isSelected[0] == false
                    ? context.textColor
                    : context.mainColor),
            Padding(
              padding: context.midVerticalPadding,
              child: Text(
                RegisterText.womanText,
                style: context.subtitle1(context)?.copyWith(
                    color: isSelected[0] == false
                        ? context.textColor
                        : context.mainColor),
              ),
            )
          ],
        ),
        Column(
          children: [
            Icon(Icons.female,
                size: MediaQuery.of(context).size.height / 6,
                color: isSelected[0] == true
                    ? context.textColor
                    : Colors.blue.shade900),
            Padding(
              padding: context.midVerticalPadding,
              child: Text(
                RegisterText.manText,
                style: context.subtitle1(context)?.copyWith(
                    color: isSelected[0] == true
                        ? context.textColor
                        : Colors.blue),
              ),
            )
          ],
        )
      ],
      isSelected: isSelected,
      onPressed: (index) {
        setState(() {
          for (var i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
              choiceControl();
            } else {
              isSelected[i] = false;
            }
          }
        });
      },
      color: context.scndTxtColor,
    );
  }

  void _registerOnTap() {
    if (isSelected.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AgePage(
                    mail: widget.mail,
                    username: widget.username,
                    password: widget.password,
                    uid: widget.uid,
                    name: widget.name,
                    gender: choiceControl().toString(),
                  )));
    } else {
      _warningToast(WarningText.sexWarningText);
    }
  }

  Future<bool?> _warningToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: context.mainColor,
        textColor: context.textColor,
        fontSize: 14);
  }

  choiceControl() {
    if (isSelected[0] == true) {
      choice = RegisterText.womanText;
    } else {
      choice = RegisterText.manText;
    }
    return choice;
  }
}
