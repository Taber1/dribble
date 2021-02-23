import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: HomeScreen());
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
      body: SingleChildScrollView(
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
                            border:
                                Border.all(color: Colors.grey[400], width: 2.5),
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
            )
          ],
        ),
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
