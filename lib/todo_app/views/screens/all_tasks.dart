import 'package:flutter/material.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:instagram_ui/todo_app/views/components/task_widget.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatelessWidget {
  AllTasks( {super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, x) {
        return 
        tasksProvider.allTasks.isEmpty ?
        Center(child: Icon(Icons.add_card_rounded,size: 50,),):
        ListView.builder(
            itemCount: tasksProvider.allTasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskWidget(tasksProvider.allTasks[index]);
            });
      }
    );
  }
}
