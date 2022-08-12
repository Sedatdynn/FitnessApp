import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import '../../core/const/const_shelf.dart';

class HeightPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final String? age;
  final String uid;
  const HeightPage(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender,
      this.age})
      : super(key: key);

  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  int _currentValue = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: context.minLtrb,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoBody(),
              SizedBox(
                height: context.height / 17,
              ),
              ConstText(
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
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WeightPage(
                username: widget.username,
                mail: widget.mail,
                password: widget.password,
                uid: widget.uid,
                name: widget.name,
                gender: widget.gender,
                age: widget.age,
                height: _currentValue.toString(),
              )),
    );
  }

  _pickerBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NumberPicker(
          selectedTextStyle:
              context.headline6(context)?.copyWith(color: context.mainColor),
          textStyle: context.subtitle2(context),
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
        Container(
          margin: context.midLeft,
          child: Text(
            RegisterText.cmText,
            style: context.subtitle2(context),
          ),
        )
      ],
    );
  }
}
