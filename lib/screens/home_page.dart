import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:the_sol_mag/models/main_feed_model.dart';
import 'package:the_sol_mag/screens/ArticlePage.dart';
import 'package:the_sol_mag/services/feed_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  FeedList obj = new FeedList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NeumorphicAppBar(
          title: NeumorphicText(
            'THE SOL MAG',
            style:
                NeumorphicStyle(depth: 5, intensity: 5, color: Colors.blueGrey),
            textStyle: NeumorphicTextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "ArchivoBlack"),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemCount: feedList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Neumorphic(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlePage(
                                  feedArticle: feedList[index],
                                )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        // 'https://thesolmag.com/wp-content/uploads/2020/11/Amanda-Oleander.jpg',
                        feedList[index].featuredImage.large,
                        height: 200,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                        child: NeumorphicText(
                          // 'WELLNESS',
                          feedList[index].category.toUpperCase(),
                          style: NeumorphicStyle(
                              depth: 0, intensity: 0, color: Colors.blueGrey),
                          textStyle: NeumorphicTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                        child: NeumorphicText(
                          // 'Rigid, Porous and Healthy– know your boundaries!',
                          feedList[index].title,
                          style: NeumorphicStyle(
                              depth: 0, intensity: 0, color: Colors.blueGrey),
                          textStyle: NeumorphicTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                        child: NeumorphicText(
                          // 'Learn how to readjust your personal boundaries with no strained relationships',
                          feedList[index].excerpt,
                          style: NeumorphicStyle(
                              depth: 0, intensity: 0, color: Colors.blueGrey),
                          textStyle: NeumorphicTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Roboto"),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                      //       child: Neumorphic(
                      //         style: NeumorphicStyle(
                      //             shape: NeumorphicShape.concave,
                      //             boxShape: NeumorphicBoxShape.roundRect(
                      //                 BorderRadius.circular(100)),
                      //             depth: 2,
                      //             lightSource: LightSource.topLeft,
                      //             color: Colors.grey),
                      //         child: NeumorphicButton(
                      //           child: NeumorphicIcon(
                      //             Icons.favorite,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                      //       child: Neumorphic(
                      //         style: NeumorphicStyle(
                      //             shape: NeumorphicShape.concave,
                      //             boxShape: NeumorphicBoxShape.roundRect(
                      //                 BorderRadius.circular(100)),
                      //             depth: 2,
                      //             lightSource: LightSource.topLeft,
                      //             color: Colors.grey),
                      //         child: NeumorphicButton(
                      //           child: NeumorphicIcon(
                      //             Icons.bookmark,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                )),
              );
            }));
  }

  List<Feed> feedList = new List<Feed>();

  void fetchFeed() async {
    setState(() {
      _isLoading = true;
    });
    try {
      feedList = await obj.getFeedList();
    } catch (e) {
      print('|{${e.toString()}|Caught you too..');
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchFeed();
    super.initState();
  }
}
