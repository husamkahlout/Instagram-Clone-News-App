import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/provider.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:instagram_ui/todo_app/views/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'news_app/views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

//===================================== class MyApp ===================================
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  changeTheme(bool value) {
    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider()),
          ChangeNotifierProvider<TasksProvider>(
              create: (context) => TasksProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: isDark ? ThemeData.dark() : ThemeData.light(),
            home: TasksHomePage(changeTheme, isDark),
          );
        });
  }
}

// =================================== class Home Page ======================================

class HomePage extends StatelessWidget {
  Function function;
  bool isDark;
  HomePage(this.function, this.isDark, {super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Home"),
              ),
              Tab(
                child: Text("Home2"),
              ),
              Tab(
                child: Text("Home3"),
              ),
              Tab(
                child: Text("Home4"),
              ),
              Tab(
                text: "Home5",
                icon: Icon(Icons.home),
                // child: Text("Home5"),
              ),
              Tab(
                child: Text("Home6"),
              ),
              Tab(
                child: Text("Home7"),
              ),
              Tab(
                child: Text("Home8"),
              ),
              Tab(
                child: Text("Home9"),
              ),
            ],
          ),
          actions: [
            Center(
              child: Text(
                isDark ? "ON" : 'OFF',
              ),
            ),
            Switch(
                value: isDark,
                onChanged: (value) {
                  function(value);
                }),
          ],
        ),
        body: const TabBarView(children: [
          Center(child: Text("Home1")),
          Center(child: Text("Home2")),
          Center(child: Text("Home3")),
          Center(child: Text("Home4")),
          Center(child: Text("Home5")),
          Center(child: Text("Home6")),
          Center(child: Text("Home7")),
          Center(child: Text("Home8")),
          Center(child: Text("Home9")),
        ]),
      ),
    );
  }
}
