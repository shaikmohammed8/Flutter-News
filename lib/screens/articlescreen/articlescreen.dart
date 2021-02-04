import 'dart:ui';

import 'package:flutter_new_app/controller/databsecontroller.dart';
import 'package:flutter_new_app/models/article.model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
  var controller = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    Article args = Get.arguments;
    var title = args.title;
    var imageUrl = args.urlToImage;
    var discription = args.description;
    var content = args.content;
    var url = args.url;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Article"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 260,
                child: Image.network(imageUrl, fit: BoxFit.cover)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  discription == null
                      ? Container()
                      : Text(
                          discription,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  content == null
                      ? Container()
                      : Text(
                          content,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: "Want to see Full Article Click Here",
                        ),
                        TextSpan(
                            text: "\n$url",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (await canLaunch(url)) await launch(url);
                              },
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline))
                      ]))
                ]),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            controller.addOrDeleteArticle(args);
          },
          child: Obx(() => Icon(
                controller.isFav.value
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                size: 30,
              ))),
    );
  }
}
