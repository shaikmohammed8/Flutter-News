import 'package:flutter/material.dart';
import 'package:flutter_new_app/controller/apicontroller.dart';
import 'package:flutter_new_app/controller/databsecontroller.dart';
import 'package:flutter_new_app/screens/articlescreen/articlescreen.dart';
import 'package:get/get.dart';

import 'widgets/categoties.dart';
import 'widgets/newsView.dart';

class NewsScreen extends StatelessWidget {
  var controller = Get.put(DatabaseController());
  var apicontroller = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Obx(
        () {
          return apicontroller.products.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: apicontroller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? NewsCategory()
                        : InkWell(
                            onTap: () {
                              controller.chekAriticle(
                                  apicontroller.products[index].url);
                              Get.to(ArticleScreen(),
                                  arguments: apicontroller.products[index]);
                            },
                            child: NewsWidget(
                              imageUrl:
                                  apicontroller.products[index].urlToImage,
                              title: apicontroller.products[index].title,
                              url: apicontroller.products[index].url,
                              date: apicontroller.products[index].publishedAt,
                            ),
                          );
                  },
                );
        },
      ))
    ]);
  }
}
