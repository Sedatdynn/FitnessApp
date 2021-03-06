// ignore_for_file: prefer_const_constructors

import 'package:fistness_app_firebase/views/views_shelf.dart';

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
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _myText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              _nameField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              _mybutton()
            ],
          ),
        ),
      ),
    );
  }

  _myText() {
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
        height: mediaQuery.height * 0.09,
        width: mediaQuery.width * 0.87,
        child: Text(
          questionsText.nameText,
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  _nameField() {
    return TextField(
        style: TextStyle(color: Colors.white),
        controller: _nameController,
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: questionsText.nameText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade900),
                borderRadius: BorderRadius.circular(10))));
  }

  _mybutton() {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.87,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
          ),
          onPressed: _registerOnTap,
          child: Text(myText.nextText),
        ),
      ),
    );
  }

  void _registerOnTap() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
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
      _warningToast(warningText.nameWarningText);
    }
  }

  Future<bool?> _warningToast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14);
  }
}
