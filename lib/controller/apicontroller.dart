import 'package:flutter_new_app/models/article.model.dart';
import 'package:flutter_new_app/models/news_model.dart';
import 'package:flutter_new_app/services/network_service.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var name = "Top".obs;
  var news = NewsModel();
  var products = List<Article>().obs;
  var url =
      "http://newsapi.org/v2/top-headlines?country=in&apiKey=138022a07ad0490a848fd2d4dc786a9e";

  @override
  void onInit() {
    fetchdate(url);
    super.onInit();
  }

  void buissnesCall(String url, String name) {
    fetchdate(url);
    this.name.value = name;
  }

  void fetchdate(String url) async {
    var news = await NetworkSevice.fetchDate(url);
    if (news.articles.isNotEmpty) {
      products.value = news.articles;
    } else {
      products.value = null;
    }
  }
}
