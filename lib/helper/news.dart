import 'dart:convert';
//import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/article_model.dart';
//import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  List<ArticlesModel> news = [];
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=5da64ef72a3e4f058a486dee118dca1e";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticlesModel article = ArticlesModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element["url"],
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticlesModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=5da64ef72a3e4f058a486dee118dca1e";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticlesModel article = ArticlesModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element["url"],
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }
}

//  var response = await http.get(url);
//   var jsonData = jsonDecode(response.body);
//   if (jsonData['status'] == "ok") {
//     jsonData["articles"].forEach((element) {
//       if (element["urlToImage"] != null && element['description'] != null) {
//         ArticlesModel articlesModel = ArticlesModel(
//           title: element['title'],
//           author: element['author'],
//           description: element['description'],
//           url: element['url'],
//           urlToImage: element['urlToImage'],
//           //  publishedAt: element['publishedAt'],
//           content: element['content'],
//         );
