import '../models/task_model.dart';

class TaskController {
  List<TaskModel> getTasks() {
    return [
      TaskModel(id: 1, title: 'Học Flutter'),
      TaskModel(id: 2, title: 'Làm bài tập'),
      TaskModel(id: 3, title: 'Ôn thi'),
      TaskModel(id: 4, title: 'Nộp bài'),
    ];
  }

  Future<void> deleteTask(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}