// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_full_hex_values_for_flutter_colors

import 'package:fistness_app_firebase/views/views_shelf.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String image_url =
        "https://image.shutterstock.com/image-vector/vector-illustration-bodybuilder-muscular-arm-260nw-1464554840.jpg";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 1),
              blurRadius: 20,
              color: const Color(0xFF19282F),
            )
          ],
          gradient: LinearGradient(
              colors: [
                const Color(0xFF3d444e),
                const Color(0xFF2c2f37),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 1),
                            blurRadius: 20,
                            color: const Color(0xFF19282F),
                          )
                        ],
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF19282F),
                              const Color(0xFF000000),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Icon(
                        Icons.receipt_outlined,
                        color: Color(0xFFC4FB6D),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          (MaterialPageRoute(
                            builder: (context) => LaunchPage(),
                          )));
                    },
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFF19282F),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 1),
                              blurRadius: 20,
                              color: Color(0xFF0B0B0C))
                        ],
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF19282F),
                              const Color(0xFF000000),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Icon(
                        Icons.account_box,
                        color: Color(0xFFC4FB6D),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          (MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          )));
                    },
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(16),
                height: height / 3.5,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 1),
                      blurRadius: 20,
                      color: const Color(0xFF19282F),
                    )
                  ],
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFF2a2d32),
                        const Color(0xFF4b4f5b),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 20.0, 16.0),
                      child: Text(
                        myText.homeWelcomeText,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Hero(
                                tag: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(image_url,
                                      fit: BoxFit.cover,
                                      height: 70.0,
                                      width: 70.0),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("25",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Normal",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text("Kg: 85",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Age: 22",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Tall: 193",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 2),
                                blurRadius: 10,
                                color: const Color(0xFF19282F),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.settings,
                            size: 35,
                            color: Color(0xFFC4FB6D),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          String image_path = "assets/exercise.png";
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 18),
                                    height: 200,
                                    width: width / 2.4,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF2a2d32),
                                            const Color(0xFF4b4f5b),
                                          ],
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 1.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF19282F)
                                                .withOpacity(0.5),
                                            offset: Offset(10, 10.0),
                                            blurRadius: 3)
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50)),
                                            image: DecorationImage(
                                              image: AssetImage(image_path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            myText.exerciseText,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 18),
                                    height: 200,
                                    width: width / 2.4,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF2a2d32),
                                            const Color(0xFF4b4f5b),
                                          ],
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 1.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16),
                                          bottomRight: Radius.circular(16)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF19282F)
                                                .withOpacity(0.5),
                                            offset: Offset(10, 10.0),
                                            blurRadius: 3)
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(50)),
                                            image: DecorationImage(
                                              image: AssetImage(image_path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            myText.exerciseText,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        }))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFFC4FB6D),
            ),
            label: myText.bnFirstText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xFFC4FB6D)),
            label: myText.bnSecondText,
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Color(0xFFC4FB6D),
            ),
            label: myText.bnThirdText,
          ),
        ],
      ),
    );
  }
}
