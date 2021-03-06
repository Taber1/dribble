import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScreen extends StatefulWidget {
  final String imgUrl;
  PostScreen({this.imgUrl});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  static const double minExtent = 0.25;
  static const double maxExtent = 0.9;
  bool isExpanded = false;
  double initialExtent = minExtent;
  BuildContext draggableSheetContext;
  IconData icon = Icons.arrow_drop_up;

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
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              // padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: NetworkImage("${widget.imgUrl}"))
              ),
              child: Stack(
                children: [
                  // SizedBox(),
                  Swiper(
                      itemCount: 1,
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.imgUrl))),
                          )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
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
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("More"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _commentBody()
          ],
        ),
      ),
    );
  }

  Widget _commentBody() {
    return DraggableScrollableActuator(
      child: DraggableScrollableSheet(
        key: Key(initialExtent.toString()),
        minChildSize: minExtent,
        maxChildSize: maxExtent,
        initialChildSize: initialExtent,
        builder: _draggableScrollableSheetBuilder,
      ),
    );
  }

  void _toggleDraggableScrollableSheet() {
    if (draggableSheetContext != null) {
      setState(() {
        initialExtent = isExpanded ? minExtent : maxExtent;
        isExpanded = !isExpanded;
        icon = isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up;
      });
      DraggableScrollableActuator.reset(draggableSheetContext);
    }
  }

  Widget _draggableScrollableSheetBuilder(
    BuildContext context,
    ScrollController scrollController,
  ) {
    draggableSheetContext = context;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _toggleDraggableScrollableSheet();
            },
            child: Icon(icon),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg'),
                    ),
                    title: Text("Person's Name"),
                    subtitle: Text("Comment to Post"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlatButton(
                            minWidth: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.grey[300],
                            onPressed: () {},
                            child: Text("Reply")),
                        SizedBox(
                          width: 5,
                        ),
                        FlatButton(
                            minWidth: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            color: Colors.grey[300],
                            onPressed: () {},
                            child: Icon(Icons.favorite))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
