import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/app/todo.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:userorient_flutter/userorient_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox('myToDoBox');

  UserOrient.configure(
    apiKey: 'b0841b71-e5b0-4b78-baa6-bd3b32815afb',
    languageCode: 'en',
  );

  runApp(
    const ProviderScope(
      child: ToDoApp(),
    ),
  );
}
