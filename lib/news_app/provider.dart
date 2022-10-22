import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/data/news_response.dart';
import 'package:instagram_ui/news_app/models/news_model.dart';

class HomeProvider extends ChangeNotifier {

  List<NewsModel> favouriteNews = [];
  getFavouriteNews() {
    favouriteNews =  news.where((element) => element.isLike).toList();
  }

  changeLike(NewsModel newsModel) {
    newsModel.isLike = !newsModel.isLike;
    notifyListeners();
  }
}
