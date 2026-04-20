import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../models/task_model.dart';

class DeleteTaskView extends StatefulWidget {
  const DeleteTaskView({super.key});

  @override
  State<DeleteTaskView> createState() => _DeleteTaskViewState();
}

class _DeleteTaskViewState extends State<DeleteTaskView> {
  final TaskController controller = TaskController();
  late List<TaskModel> tasks;

  @override
  void initState() {
    super.initState();
    tasks = controller.getTasks();
  }

  Future<void> handleDelete(TaskModel task) async {
    await controller.deleteTask(task.id);

    setState(() {
      tasks.removeWhere((item) => item.id == task.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${task.title} đã bị xóa')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Item')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Dismissible(
            key: Key(task.id.toString()),
            background: Container(color: Colors.red),
            onDismissed: (_) => handleDelete(task),
            child: ListTile(
              title: Text(task.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => handleDelete(task),
              ),
            ),
          );
        },
      ),
    );
  }
}