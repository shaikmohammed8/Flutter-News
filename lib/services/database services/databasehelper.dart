import 'package:flutter_new_app/models/article.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();
  static final tableName = "Article";

  DatabaseHelper._();
  factory DatabaseHelper() {
    return _databaseHelper;
  }

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    var db = await initDatabase();
    return db;
  }

  Future<Database> initDatabase() async {
    var dir = await getDatabasesPath();
    var path = join(dir, "news.db");
    var database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute("""
      create table $tableName(
        ${Article.colUrl} text not null,
        ${Article.colUrlToImage} text not null,
        ${Article.colTitle} text not null,
        ${Article.colPublishedAt} text ,
        ${Article.colContent} text ,
        ${Article.colDescription} text 
      )
      """);
    });
    return database;
  }

  insert(Article article) async {
    var db = await database;
    await db.insert(tableName, article.toMap());
  }

  Future<List<Article>> queryAll() async {
    var db = await database;
    var result = await db.query(tableName);
    List<Article> list = [];
    result.forEach((element) {
      list.add(Article.fromMap(element));
    });
    print(list.length);
    return list;
  }

  delete(String url) async {
    var bd = await database;
    await bd.delete(tableName, where: "${Article.colUrl}=?", whereArgs: [url]);
  }

  Future<List<dynamic>> querty(String url) async {
    var db = await database;
    var result = await db
        .query(tableName, where: "${Article.colUrl}=?", whereArgs: [url]);

    var list = [];
    result.forEach((element) {
      list.add(Article.fromMap(element));
    });
    print(list.length);
    return list;
  }
}
