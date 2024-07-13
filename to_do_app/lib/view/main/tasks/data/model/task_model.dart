import 'dart:ui';

class Task {
  final String name;
  final String description;
  final String category;
  final String date;
  final String startTime;
  final String endTime;
  bool isPast;
  bool isCompleted;

  Task({
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
    return isPast ? const Color(0xFF806DFB) : const Color.fromARGB(255, 250, 234, 253);
  }
}
