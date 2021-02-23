import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey), home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool horVal = false;
  bool swiftVal = false;
  bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              return showGeneralDialog(
                context: context,
                barrierDismissible: true,
                transitionDuration: Duration(milliseconds: 500),
                barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                barrierColor: Colors.black.withOpacity(0.5),
                pageBuilder: (context, _, __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  Text("Visualization"),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 75,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text('1'),
                                              ),
                                              Text("Ample")
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 75,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text('2'),
                                              ),
                                              Text("Clean")
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 75,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text('3'),
                                              ),
                                              Text("Old"),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Horizontal"),
                                              Switch(
                                                value: horVal,
                                                onChanged: (horVal) {},
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Swift Chat"),
                                              Switch(
                                                value: horVal,
                                                onChanged: (horVal) {},
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Dark Theme"),
                                              Switch(
                                                value: horVal,
                                                onChanged: (horVal) {},
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.arrow_drop_up_outlined),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  );
                },
                transitionBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ).drive(Tween<Offset>(
                      begin: Offset(0, -1.0),
                      end: Offset.zero,
                    )),
                    child: child,
                  );
                },
              );
            },
          ),
        ),
        title: Text("Instagram"),
        actions: [
          IconButton(icon: Icon(Icons.mail_outline_outlined), onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[400], width: 2.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.grey[400],
                              ),
                            ),
                            Text("My Story")
                          ],
                        ),
                      ),
                      PeopleBox(),
                      PeopleBox(),
                      PeopleBox(),
                      PeopleBox(),
                      PeopleBox(),
                      PeopleBox(),
                      PeopleBox(),
                      PeopleBox(),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Align(
                      heightFactor: 0.9,
                      alignment: Alignment.topCenter,
                      child: PostsBox(
                        imgUrl:
                            "https://cdn.pixabay.com/photo/2021/01/27/07/19/book-5953965__340.jpg",
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.add_box_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.favorite,
                        size: 35,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PeopleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.pink, Colors.orange]),
                borderRadius: BorderRadius.circular(30)),
            child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg'))),
                )),
          ),
          Text("Dobby")
        ],
      ),
    );
  }
}

class PostsBox extends StatelessWidget {
  String imgUrl;
  PostsBox({this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage("$imgUrl"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Person's Name")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.favorite), Text(" 1.9K")],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [Icon(Icons.sms_rounded), Text(" 3.4K")],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.paperPlane,
                        size: 20,
                      ),
                    ],
                  ),
                  Icon(FontAwesomeIcons.bookmark)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
