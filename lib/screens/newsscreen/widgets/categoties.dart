import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_new_app/controller/apicontroller.dart';
import 'package:flutter_new_app/data/data.dart';
import 'package:get/get.dart';

class NewsCategory extends StatelessWidget {
  ApiController apiController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(left: 10),
        child: const Text(
          "Catogery",
          style:
              TextStyle(color: Colors.brown, fontSize: 18, letterSpacing: 1.5),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: getCategories().length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    apiController.buissnesCall(getCategories()[index].url,
                        getCategories()[index].categorieName);
                    apiController.products.length = 0;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: double.infinity,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                getCategories()[index].imageAssetUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black45),
                              alignment: Alignment.center,
                              child: Text(
                                getCategories()[index].categorieName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Obx(
            () => RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: apiController.name.value),
                    TextSpan(text: ' News')
                  ]),
            ),
          )
          // Text(
          //   "Top News",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 25,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          ),
    ]);
  }
}
