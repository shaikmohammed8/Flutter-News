import 'package:flutter/services.dart';
import 'package:flutter_new_app/models/article.model.dart';
import 'package:flutter_new_app/services/database%20services/databasehelper.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  var articles = List<Article>().obs;
  var isFav = false.obs;
  var database = DatabaseHelper();

  @override
  void onInit() {
    getAllArticle();
    super.onInit();
  }

  void addOrDeleteArticle(Article article) async {
    var list = await database.querty(article.url);
    if (list.length == 0) {
      database.insert(article);
      isFav.value = true;
      print("add");
    } else {
      database.delete(article.url);
      isFav.value = false;
      print("delete");
    }
    getAllArticle();
  }

  void chekAriticle(String url) async {
    var list = await database.querty(url);
    if (list.length != 0) {
      isFav.value = true;
    } else {
      isFav.value = false;
    }
  }

  void getAllArticle() async {
    var list = await database.queryAll();
    articles.value = list;
  }

  void delete(String url) {
    database.delete(url);
    getAllArticle();
  }
}
