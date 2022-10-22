import 'package:flutter/material.dart';
import 'package:instagram_ui/todo_app/models/task_model.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:provider/provider.dart';

class NewTask extends StatelessWidget {
  NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Task"),
        centerTitle: true,
      ),
      body: Consumer<TasksProvider>(builder: (context, tasksProvider, x) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Colors.grey.withOpacity(0.12)),
              borderRadius: BorderRadius.circular(4)),
          child: TextFormField(
            controller: tasksProvider.titleController,
            decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () {
                      tasksProvider
                          .addNewTask(TaskModel(title: tasksProvider.titleController.text));
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.send))),
            // onSubmitted: (value),
          ),
        );
      }),
    );
  }
}
