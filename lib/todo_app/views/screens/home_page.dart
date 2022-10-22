import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/models/news_model.dart';
import 'package:instagram_ui/news_app/views/screens/all_news.dart';
import 'package:instagram_ui/news_app/views/screens/favourite_news.dart';
import 'package:instagram_ui/todo_app/models/task_model.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:instagram_ui/todo_app/views/screens/all_tasks.dart';
import 'package:instagram_ui/todo_app/views/screens/completed_tasks.dart';
import 'package:instagram_ui/todo_app/views/screens/incompleted_tasks.dart';
import 'package:instagram_ui/todo_app/views/screens/new_task.dart';
import 'package:provider/provider.dart';

class TasksHomePage extends StatefulWidget {
  bool isDark;
  Function function;
  TasksHomePage(this.function, this.isDark, {super.key});

  @override
  State<TasksHomePage> createState() => _TasksHomePageState();
}

class _TasksHomePageState extends State<TasksHomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TasksProvider>(context, listen: false).titleController.clear();
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return NewTask();
          })));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
        actions: [
          Switch(
              value: widget.isDark,
              onChanged: (value) => widget.function(value))
        ],
        bottom: TabBar(controller: tabController, tabs: const [
          Tab(
            icon: Icon(Icons.list),
          ),
          Tab(
            icon: Icon(Icons.done_rounded),
          ),
          Tab(
            icon: Icon(Icons.cancel_rounded),
          ),
        ]),
      ),
      body: TabBarView(controller: tabController, children: [
        AllTasks(),
        CompletedTasks(),
        InCompletedTasks(),
      ]),
    );
  }
}
