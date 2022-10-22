import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/data/news_response.dart';
import 'package:instagram_ui/news_app/models/news_model.dart';
import 'package:instagram_ui/news_app/provider.dart';
import 'package:instagram_ui/news_app/views/widgets/news_widget.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {

  FavouriteScreen({super.key});

  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, x) {
        return ListView.builder(
          itemCount: homeProvider.favouriteNews.length,
          itemBuilder: (BuildContext context, int index) {
            return NewsWidget(
                homeProvider.favouriteNews[index]);
          },
        );
      }
    );
  }
}
