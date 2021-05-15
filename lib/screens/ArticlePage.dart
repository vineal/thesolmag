import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:the_sol_mag/models/main_feed_model.dart';

class ArticlePage extends StatelessWidget {
  final Feed feedArticle;
  ArticlePage({@required this.feedArticle});

  String author = "Ashwathi Namboodiri";
  String imageVia = "Leah Kelley from Pexels";
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              feedArticle.featuredImage.large,
              // "https://thesolmag.com/wp-content/uploads/2020/12/Leah-Kelley-pexels-1024x682.jpg",
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
              child: Text(
                // '10 ways used tea bags can change your life for good',
                feedArticle.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Colors.blueGrey),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              child: Text(
                'By ${author}| Image via ${imageVia}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Roboto",
                    color: Colors.blueGrey),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 30.0),
              child: Html(
                data: """
            ${feedArticle.content}
            """,
                // onLinkTap: (url) {
                //   print("Opening $url...");
                // },
                // customRender: (node, children) {
                //   if (node is dom.Element) {
                //     switch (node.localName) {
                //       case "custom_tag": // using this, you can handle custom tags in your HTML
                //         return Column(children: children);
                //     }
                //   }
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
