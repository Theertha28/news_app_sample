import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_sample/model/top_ten_model.dart';

class HomeScreenController with ChangeNotifier {
  TopTenModel? topTenModel;
  List<Article> newsArticles = [];
  bool isLoading = false;
  Future<void> getTopNews() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=ccb4ed33c49e421db16e143aea9c11d6");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        topTenModel = topTenModelFromJson(res.body);
        if (topTenModel != null) {
          newsArticles = topTenModel!.articles ?? [];
        }
        log(newsArticles[0].title.toString());
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  // Future<void> getNews(String us) async {
  //   isLoading = true;
  //   notifyListeners();
  //   final url = Uri.parse(
  //       "https://newsapi.org/v2/everything?q=$us&apiKey=ccb4ed33c49e421db16e143aea9c11d6");
  //   try {
  //     var res = await http.get(url);
  //     if (res.statusCode == 200) {
  //       topTenModel = topTenModelFromJson(res.body);
  //       if (topTenModel != null) {
  //         newsArticles = topTenModel!.articles ?? [];
  //       }
  //       log(newsArticles[0].title.toString());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }
}
