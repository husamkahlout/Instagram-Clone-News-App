import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/models/news_model.dart';
import 'package:instagram_ui/news_app/views/screens/all_news.dart';
import 'package:instagram_ui/news_app/views/screens/favourite_news.dart';

class HomeScreen extends StatefulWidget {
  bool isDark;
  Function function;
  HomeScreen(this.function, this.isDark,{super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          centerTitle: true,
          actions: [
            Switch(value: widget.isDark, onChanged: (value) => widget.function(value))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: "All News",
            ),
            Tab(
              text: "Favourite News",
            ),
          ]),
        ),
      body:  TabBarView(children: [
        AllNewsScreen(),
        FavouriteScreen(),
      ]),
      ),
    );
  }
}
