import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)

class ToDo extends HiveObject{
  ToDo({
    required this.category,
    required this.titleTask,
    required this.description,
    required this.isDone,
    required this.timeTask,
    required this.dateTask,
  });

  @HiveField(0)
  String titleTask;

  @HiveField(1)
  String description;

  @HiveField(2)
  String category;

  @HiveField(3)
  String timeTask;

  @HiveField(4)
  String dateTask;

  @HiveField(5)
  bool isDone;

  factory ToDo.create({
    required String? titleTask,
    required String? description,
    String? timeTask,
    String? dateTask,
    String? category,
  }) =>
      ToDo(
        titleTask: titleTask ?? "",
        description: description ?? "",
        isDone: false,
        timeTask: timeTask ?? "",
        dateTask: dateTask ?? "",
        category: category ?? "" ,
      );

}
