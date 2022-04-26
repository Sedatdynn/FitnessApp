// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_field
import 'package:fistness_app_firebase/views/views_shelf.dart';

class WeightPage extends StatefulWidget {
  final String? username;
  final String? mail;
  final String? password;
  final String? name;
  final String? gender;
  final String? age;
  final String? height;
  final String uid;

  const WeightPage({
    Key? key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
    this.age,
    this.height,
  }) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int _currentValue = 65;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC4FB6D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _logoBody(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
              ),
              _myText(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              _pickerBody(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              _myButton(),
            ],
          ),
        ),
      ),
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

  _myText() {
    return Text(
      questionsText.weightText,
      style: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  _myButton() {
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
            try {
              if (widget.password!.isNotEmpty) {
                _registerOnTap();
              } else {
                registerUser();
              }
            } catch (e) {
              registerUser();
            }
          },
          child: Text(myText.nextText,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    );
  }

  _pickerBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NumberPicker(
          selectedTextStyle: TextStyle(color: Colors.red, fontSize: 20.0),
          textStyle: TextStyle(fontSize: 14.0, color: Colors.white),
          decoration: BoxDecoration(
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
          value: _currentValue,
          minValue: 30,
          maxValue: 200,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Container(
          margin: EdgeInsets.only(left: 12.0),
          child: Text(
            registerText.kgText,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        )
      ],
    );
  }

  void _registerOnTap() {
    if (widget.username.toString().isNotEmpty &&
        widget.mail.toString().isNotEmpty &&
        widget.password.toString().isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      try {
        myText.authService
            .createPersonEmail(
                widget.username!,
                widget.mail!,
                widget.password!,
                widget.uid,
                widget.name!,
                widget.gender!,
                widget.age!,
                widget.height!,
                _currentValue.toString())
            .then((value) {
          _warningToast(registerText.registerSuccesfully);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);
        }).catchError((error) {
          if (error.toString().contains("email-already-in-use")) {
            _warningToast(warningText.registerUniqueMail);
          }
        }).whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
      } catch (e) {
        if (e.toString().contains("email-already-in-use")) {
          _warningToast(warningText.registerUniqueMail);
        }
      }
    } else {
      _warningToast(warningText.errorText);
    }
  }

  void registerUser() async {
    dynamic user = await myText.authService.createPerson(
        widget.username!,
        widget.mail!,
        widget.uid,
        widget.name!,
        widget.gender!,
        widget.age!,
        widget.height!,
        _currentValue.toString());

    if (user) {
      _warningToast(registerText.registerSuccesfully);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }
}

Future<bool?> _warningToast(String text) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14);
}
