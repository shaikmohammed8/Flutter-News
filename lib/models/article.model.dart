import './source_model.dart';

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
      };

  static const colTitle = "title";
  static const colDescription = "description";
  static const colUrl = "url";
  static const colUrlToImage = "urlToImage";
  static const colPublishedAt = "publishedAt";
  static const colContent = "content";

  factory Article.fromMap(Map<String, dynamic> map) => Article(
        title: map[colTitle],
        description: map[colDescription],
        url: map[colUrl],
        urlToImage: map[colUrlToImage],
        publishedAt: DateTime.parse(map[colPublishedAt]),
        content: map[colContent] == null ? null : map[colContent],
      );

  Map<String, dynamic> toMap() => {
        colTitle: title,
        colDescription: description,
        colUrl: url,
        colUrlToImage: urlToImage,
        colPublishedAt: publishedAt.toIso8601String(),
        colContent: content == null ? null : content,
      };
}
