import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/data/news_response.dart';
import 'package:instagram_ui/news_app/views/widgets/news_widget.dart';

class AllNewsScreen extends StatelessWidget {

  AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return NewsWidget(news[index]);
      },
    );
  }
}
