import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/view/main/home/data/category_storage_service.dart';
import 'package:to_do_app/view/main/tasks/data/model/task_storage_service.dart';

class TaskProvider with ChangeNotifier {
  final TaskStorageService _taskStorageService = TaskStorageService();
  final CategoryStorageService _categoryStorageService = Get.find<CategoryStorageService>();
  List<Task> _tasks = [];

  TaskProvider() {
    _tasks = _taskStorageService.getTasks();
  }

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    _taskStorageService.saveTasks(_tasks);
    _updateCategoryProgress(task.category);
    notifyListeners(); 
  }

  void updateTaskStatus(Task task) {
    task.isCompleted = !task.isCompleted;
    task.isPast = !task.isPast;
    _taskStorageService.saveTasks(_tasks);
    _updateCategoryProgress(task.category);
    notifyListeners();
  }

  void toggleIsPast(Task task) {
    task.toggleIsPast();
    _taskStorageService.saveTasks(_tasks);
    notifyListeners();
  }

  List<Task> getTasksByCategory(String category) {
    return _tasks.where((task) => task.category == category).toList();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    _taskStorageService.saveTasks(_tasks);
    _updateCategoryProgress(task.category);
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

  void _updateCategoryProgress(String category) {
    double progress = getCompletedTasksPercentage(category);
    _categoryStorageService.saveProgress(category, progress);
  }
}
