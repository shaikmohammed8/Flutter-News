import 'package:flutter_new_app/models/news_model.dart';

import 'package:http/http.dart' as http;

class NetworkSevice {
  static var client = http.Client();
  static Future<NewsModel> fetchDate(String url) async {
    var res = await client.get(url);
    if (res.statusCode == 200) {
      var json = res.body;
      return NewsModelFromJson(json);
    } else {
      return null;
    }
  }
}
