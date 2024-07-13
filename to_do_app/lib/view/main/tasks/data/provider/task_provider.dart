import 'package:flutter/material.dart';
import 'package:to_do_app/view/main/tasks/data/model/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTaskStatus(Task task) {
    task.isCompleted = !task.isCompleted;
    task.isPast = !task.isPast;
    notifyListeners();
  }

  void toggleIsPast(Task task) {
    task.toggleIsPast();
    notifyListeners();
  }

  List<Task> getTasksByCategory(String category) {
    return _tasks.where((task) => task.category == category).toList();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  double getCompletedTasksPercentage(String category) {
    final categoryTasks =
        tasks.where((task) => task.category == category).toList();
    if (categoryTasks.isEmpty) return 0.0;

    final completedTasks =
        categoryTasks.where((task) => task.isCompleted).toList();
    return completedTasks.length / categoryTasks.length;
  }

  List<Task> searchTasks(String query) {
    if (query.isEmpty) return _tasks;
    return _tasks
        .where((task) => task.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
