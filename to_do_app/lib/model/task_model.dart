import 'dart:ui';
import 'package:uuid/uuid.dart';

class Task {
  late String id;
  late String name;
  late String description;
  late String category;
  late String date;
  late String startTime;
  late String endTime;
  late bool isPast;
  late bool isCompleted;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.isPast = false,
    this.isCompleted = false,
  });

  void toggleIsPast() {
    isPast = !isPast;
  }

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
  }

  Color getEventColor() {
    return isPast
        ? const Color(0xFF806DFB)
        : const Color.fromARGB(255, 250, 234, 253);
  }

  factory Task.create({
    required String? name,
    required String? description,
    required String? category,
    required String? date,
    required String? startTime,
    required String? endTime,
  }) =>
      Task(
        id: const Uuid().v1(),
        name: name ?? "",
        description: description ?? "",
        category: category ?? "",
        date: date ?? "",
        startTime: startTime ?? "",
        endTime: endTime ?? "",
        isPast: false,
        isCompleted: false,
      );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        category: json['category'],
        date: json['date'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        isPast: json['isPast'],
        isCompleted: json['isCompleted'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'isPast': isPast,
        'isCompleted': isCompleted,
      };
}
