import 'package:fistness_app_firebase/extensions/edge_insets.dart';
import 'package:fistness_app_firebase/views/bmi/bmi_page.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

class HomePage extends StatefulWidget {
  const HomePage({
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
    const String imageUrl =
        "https://image.shutterstock.com/image-vector/vector-illustration-bodybuilder-muscular-arm-260nw-1464554840.jpg";

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 1),
              blurRadius: 20,
              color: Color(0xFF19282F),
            )
          ],
          gradient: LinearGradient(
              colors: [
                Color(0xFF3d444e),
                Color(0xFF2c2f37),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: context.midVerticalPadding,
        child: FutureBuilder(
            future: MyText.authService.fetchCurrentUserDoc(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState != ConnectionState.waiting) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      Container(
                        padding: context.midVerticalPadding,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(5, 1),
                                      blurRadius: 20,
                                      color: Color(0xFF19282F),
                                    )
                                  ],
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF19282F),
                                        Color(0xFF000000),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: const Icon(
                                  Icons.receipt_outlined,
                                  color: Color(0xFFC4FB6D),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                      builder: (context) => const LaunchPage(),
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
                                  color: const Color(0xFF19282F),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(5, 1),
                                        blurRadius: 20,
                                        color: Color(0xFF0B0B0C))
                                  ],
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF19282F),
                                        Color(0xFF000000),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 1.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: const Icon(
                                  Icons.account_box,
                                  color: Color(0xFFC4FB6D),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    )));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: context.midAllPadding,
                          height: height / 3.5,
                          width: width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(80.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 1),
                                blurRadius: 20,
                                color: Color(0xFF19282F),
                              )
                            ],
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF2a2d32),
                                  Color(0xFF4b4f5b),
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: context.largeLtrb,
                                child: Text(
                                  MyText.homeWelcomeText +
                                      snapshot.data["username"],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Hero(
                                          tag: 0,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(imageUrl,
                                                fit: BoxFit.cover,
                                                height: 70.0,
                                                width: 70.0),
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("25",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("Normal",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: const [
                                      Text("Kg: 85",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text("Age: 22",
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                    padding: context.riBottom,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(1, 2),
                                          blurRadius: 10,
                                          color: Color(0xFF19282F),
                                        )
                                      ],
                                    ),
                                    child: const Icon(
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
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, i) {
                                    String imagePath = "assets/exercise.png";
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    (MaterialPageRoute(
                                                        builder: (context) =>
                                                            BmiCalculater(
                                                              userHeight:
                                                                  snapshot.data[
                                                                      "length"],
                                                              userWeight:
                                                                  snapshot.data[
                                                                      "weight"],
                                                            ))));
                                              },
                                              child: Container(
                                                margin: context
                                                    .midLargeVerticalPadding,
                                                height: 200,
                                                width: width / 2.4,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                            Color(0xFF2a2d32),
                                                            Color(0xFF4b4f5b),
                                                          ],
                                                          begin:
                                                              FractionalOffset(
                                                                  0.0, 0.0),
                                                          end: FractionalOffset(
                                                              1.0, 1.0),
                                                          stops: [0.0, 1.0],
                                                          tileMode:
                                                              TileMode.clamp),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  16)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xFF19282F)
                                                            .withOpacity(0.5),
                                                        offset: const Offset(
                                                            10, 10.0),
                                                        blurRadius: 3)
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50)),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              imagePath),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        MyText.exerciseText,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: context
                                                  .midLargeVerticalPadding,
                                              height: 200,
                                              width: width / 2.4,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFF2a2d32),
                                                      Color(0xFF4b4f5b),
                                                    ],
                                                    begin: FractionalOffset(
                                                        0.0, 0.0),
                                                    end: FractionalOffset(
                                                        1.0, 1.0),
                                                    stops: [0.0, 1.0],
                                                    tileMode: TileMode.clamp),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(16),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: const Color(
                                                              0xFF19282F)
                                                          .withOpacity(0.5),
                                                      offset: const Offset(
                                                          10, 10.0),
                                                      blurRadius: 3)
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      50)),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            imagePath),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      MyText.exerciseText,
                                                      style: const TextStyle(
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
                  );
                } else {
                  return const Center(child: Text("data yok"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Color(0xFFC4FB6D),
            ),
            label: MyText.bnFirstText,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search, color: Color(0xFFC4FB6D)),
            label: MyText.bnSecondText,
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_circle,
              color: Color(0xFFC4FB6D),
            ),
            label: MyText.bnThirdText,
          ),
        ],
      ),
    );
  }
}
