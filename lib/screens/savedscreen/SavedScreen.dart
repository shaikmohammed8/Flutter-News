import 'package:flutter/material.dart';
import 'package:flutter_new_app/controller/databsecontroller.dart';
import 'package:flutter_new_app/screens/articlescreen/articlescreen.dart';
import 'package:flutter_new_app/screens/newsscreen/widgets/newsView.dart';
import 'package:get/get.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DatabaseController>();
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Obx(() => ListView.builder(
                itemCount: controller.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.chekAriticle(controller.articles[index].url);
                      Get.to(ArticleScreen(),
                          arguments: controller.articles[index]);
                    },
                    child: NewsWidget(
                      imageUrl: controller.articles[index].urlToImage,
                      title: controller.articles[index].title,
                      date: controller.articles[index].publishedAt,
                      url: controller.articles[index].url,
                    ),
                  );
                },
              ))),
    ]));
  }
}
