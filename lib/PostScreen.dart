import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScreen extends StatelessWidget {
  String imgUrl;
  PostScreen({this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.65,
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
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Person's Name")
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
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
                                  children: [
                                    Icon(Icons.favorite),
                                    Text(" 1.9K")
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.sms_rounded),
                                  Text(" 3.4K")
                                ],
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 40,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                            'https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg'),
                                      )),
                                ),
                                Positioned(
                                  left: 20,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                            'https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg'),
                                      )),
                                ),
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundImage: NetworkImage(
                                          'https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg'),
                                    )),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                overflow: TextOverflow.ellipsis,
                                softWrap: true),
                          ),
                          FlatButton(
                              onPressed: () {},
                              color: Colors.white,
                              minWidth: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("More"))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView.builder(
                      itemCount: 15,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("data"),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
