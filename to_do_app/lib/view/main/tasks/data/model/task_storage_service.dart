import 'package:get_storage/get_storage.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskStorageService {
  final _storage = GetStorage();
  final _tasksKey = 'tasks';

  List<Task> getTasks() {
    final tasksJson = _storage.read<List<dynamic>>(_tasksKey) ?? [];
    return tasksJson.map((json) => Task.fromJson(json)).toList();
  }

  void saveTasks(List<Task> tasks) {
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    _storage.write(_tasksKey, tasksJson);
  }
}
