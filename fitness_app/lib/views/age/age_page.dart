import 'package:fistness_app_firebase/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';
import '../../const/const_shelf.dart';

class AgePage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String uid;
  final String? name;
  final String? gender;
  const AgePage(
      {Key? key,
      this.username,
      this.mail,
      this.password,
      required this.uid,
      this.name,
      this.gender})
      : super(key: key);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int _currentValue = 3;

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
                height: MediaQuery.of(context).size.height / 17,
              ),
              Text(
                QuestionsText.ageText,
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              myButton(),
            ],
          ),
        ),
      ),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HeightPage(
                        username: widget.username,
                        mail: widget.mail,
                        password: widget.password,
                        uid: widget.uid,
                        name: widget.name,
                        gender: widget.gender,
                        age: _currentValue.toString(),
                      )),
            );
          },
          child: Text(MyText.contiuneText,
              style: const TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    );
  }

  _pickerBody() {
    return NumberPicker(
      selectedTextStyle: const TextStyle(color: Colors.red, fontSize: 20.0),
      textStyle: const TextStyle(color: Colors.white),
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
      minValue: 0,
      maxValue: 100,
      onChanged: (value) => setState(() => _currentValue = value),
    );
  }
}
