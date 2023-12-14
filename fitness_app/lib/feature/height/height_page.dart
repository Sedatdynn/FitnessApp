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
class HeightView extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final int? age;
  final String uid;
  final String? mobility;
  const HeightView({
    Key? key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
    this.age,
    this.mobility,
  }) : super(key: key);

  @override
  State<HeightView> createState() => _HeightViewState();
}

class _HeightViewState extends State<HeightView> {
  int _currentValue = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const AppPadding.minAll(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoBody(),
              SizedBox(
                height: context.height / 17,
              ),
              const ConstText(
                text: QuestionsText.heightText,
              ),
              SizedBox(
                height: context.height / 12,
              ),
              _pickerBody(),
              SizedBox(height: context.height * 0.1),
              CommonButton(
                text: MyText.nextText,
                onPressed: _onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    RouteManager.instance.push(WeightRoute(
      username: widget.username,
      mail: widget.mail,
      password: widget.password,
      uid: widget.uid,
      name: widget.name,
      gender: widget.gender,
      age: widget.age,
      mobility: widget.mobility,
      height: _currentValue,
    ));
  }

  _pickerBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NumberPicker(
          selectedTextStyle:
              Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.mainPrimary),
          textStyle: Theme.of(context).textTheme.titleSmall,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFC4FB6D),
                width: 3.0,
              ),
              bottom: BorderSide(
                color: Color(0xFFC4FB6D),
                width: 3.0,
              ),
            ),
          ),
          value: (_currentValue),
          minValue: 100,
          maxValue: 220,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text(
          RegisterText.cmText,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
