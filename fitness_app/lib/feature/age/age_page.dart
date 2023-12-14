import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import '../../product/const/const_shelf.dart';
import '../../product/theme/colors.dart';
import '../../product/widget/appBar/custom_app_bar.dart';
import '../views_shelf.dart';

@RoutePage()
class AgeView extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String uid;
  final String? name;
  final String? gender;
  const AgeView(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender})
      : super(key: key);

  @override
  State<AgeView> createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  int _currentValue = 2004;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const AppPadding.lowHorizontal(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoBody(),
              SizedBox(
                height: context.dynamicHeight(0.17),
              ),
              Text(
                QuestionsText.ageText,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: context.dynamicHeight(0.15),
              ),
              _pickerBody(),
              SizedBox(height: context.dynamicHeight(0.1)),
              myButton(),
            ],
          ),
        ),
      ),
    );
  }

  myButton() {
    return Center(
      child: SizedBox(
        height: context.dynamicHeight(0.06),
        width: context.dynamicWidth(0.81),
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            foregroundColor: MaterialStateProperty.all<Color>(AppColors.whiteText),
            backgroundColor: MaterialStateProperty.all(AppColors.mainPrimary),
          ),
          onPressed: () {
            RouteManager.instance.push(DailyMobilityRoute(
              username: widget.username,
              mail: widget.mail,
              password: widget.password,
              uid: widget.uid,
              name: widget.name,
              gender: widget.gender,
              age: 2023 - _currentValue,
            ));
          },
          child: Text(MyText.continueText, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }

  _pickerBody() {
    return NumberPicker(
      selectedTextStyle:
          Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.mainPrimary),
      textStyle: Theme.of(context).textTheme.titleSmall,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            //                   <--- left side
            color: Color(0xFFC4FB6D),
            width: 3.0,
          ),
          bottom: BorderSide(
            //                    <--- top side
            color: Color(0xFFC4FB6D),
            width: 3.0,
          ),
        ),
      ),
      value: _currentValue,
      minValue: 1950,
      maxValue: 2004,
      onChanged: (value) => setState(() => _currentValue = value),
    );
  }
}
