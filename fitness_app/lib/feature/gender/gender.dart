import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/extensions/extensions_shelf.dart';
import '../../product/const/const_shelf.dart';
import '../../core/service/auth_service.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../age/age_page.dart';
import '../views_shelf.dart';

class GenderPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? name;
  final String? password;
  final String uid;
  const GenderPage(
      {Key? key, this.username, this.mail, this.name, this.password, required this.uid})
      : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
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
                const ConstText(
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
      color: AppColors.darkText,
      children: [
        Column(
          children: [
            Icon(Icons.male,
                size: context.height / 6,
                color: isSelected[0] == false ? AppColors.whiteText : AppColors.mainPrimary),
            Padding(
              padding: const AppPadding.normalVertical(),
              child: Text(
                RegisterText.womanText,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: isSelected[0] == false ? AppColors.whiteText : AppColors.mainPrimary),
              ),
            )
          ],
        ),
        Column(
          children: [
            Icon(Icons.female,
                size: context.height / 6,
                color: isSelected[0] == true ? AppColors.whiteText : AppColors.error),
            Padding(
              padding: const AppPadding.normalVertical(),
              child: Text(
                RegisterText.manText,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: isSelected[0] == true ? AppColors.whiteText : Colors.blue),
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
