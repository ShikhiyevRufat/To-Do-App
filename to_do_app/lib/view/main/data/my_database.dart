import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/model/todo_model.dart';

class MyDatabase {
  final myBox = Hive.box('myToDoBox');

  List<ToDo> todos = [];

  void loadData() {
    List<dynamic> storedTodos = myBox.get("TODOLIST", defaultValue: []);
    todos = List<ToDo>.from(storedTodos);
  }

  void updateDataBase() {
    myBox.put("TODOLIST", todos);
  }
}
