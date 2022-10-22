import 'package:flutter/material.dart';
import 'package:instagram_ui/todo_app/models/task_model.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:provider/provider.dart';

class EditTask extends StatelessWidget {
  TaskModel taskModel;
  EditTask(this.taskModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
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
                      tasksProvider.editTask(taskModel);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.edit))),
            // onSubmitted: (value),
          ),
        );
      }),
    );
  }
}
