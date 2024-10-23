import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_sample/model/news_res_model.dart';

class  SearchScreenController with ChangeNotifier{
  NewsResModel? newsResModel;
  List<Article> newsArticles=[];
  bool isLoading=false;
  Future<void> onSearch(String keyword) async {
    isLoading=true;
    notifyListeners();
    final url= Uri.parse(
      "https://newsapi.org/v2/everything?q=$keyword&apiKey=ccb4ed33c49e421db16e143aea9c11d6");
      try{
        var res= await http.get(url);
        if(res.statusCode == 200){
        newsResModel=newsResModelFromJson(res.body);
        if(newsResModel !=null){
          newsArticles=newsResModel!.articles??[];
        }
        }
      }catch(e){
        print(e);
      }
      isLoading=false;
      notifyListeners();
  }

  
}