import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsWidget extends StatelessWidget {
  String title, url, imageUrl;
  DateTime date;

  NewsWidget({this.imageUrl, this.title, this.url, this.date});

  @override
  Widget build(BuildContext context) {
    return nullChek()
        ? Container()
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.all(8),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black38)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(date),
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ]),
          );
  }

  bool nullChek() {
    if (title == null || url == null || imageUrl == null) {
      return true;
    }
    return false;
  }
}
