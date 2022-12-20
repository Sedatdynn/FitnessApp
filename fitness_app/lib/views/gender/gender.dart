import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
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
                  height: context.height / 17,
                ),
                ConstText(
                  text: QuestionsText.sexText,
                ),
                SizedBox(
                  height: context.height / 15,
                ),
                _toggleButton(),
                SizedBox(height: context.height * 0.05),
                CommonButton(
                  text: MyText.continueText,
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
      children: [
        Column(
          children: [
            Icon(Icons.male,
                size: context.height / 6,
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
                size: context.height / 6,
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
      warningToast(context, WarningText.sexWarningText);
    }
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
