import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoModel {
  final String taskId;
  final String uid;
  final String? email;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;
  final bool isDone;

  const ToDoModel({
    required this.taskId,
    this.email,
    required this.uid,
    required this.titleTask,
    required this.description,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'uid': uid,
        'email': email,
        'titleTask': titleTask,
        'description': description,
        'category': category,
        'dateTask': dateTask,
        'timeTask': timeTask,
        'isDone': isDone,
      };

  static ToDoModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ToDoModel(
      taskId: snap.id,
      uid: snapshot["uid"] ?? '',
      email: snapshot['email'],
      titleTask: snapshot['titleTask'] ?? '',
      description: snapshot['description'] ?? '',
      category: snapshot['category'] ?? '',
      dateTask: snapshot['dateTask'] ?? '',
      timeTask: snapshot['timeTask'] ?? '',
      isDone: snapshot['isDone'] ?? false,
    );
  }

  static ToDoModel fromFirestore(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ToDoModel(
      taskId: snap.id,
      uid: snapshot["uid"] ?? '',
      email: snapshot['email'],
      titleTask: snapshot['titleTask'] ?? '',
      description: snapshot['description'] ?? '',
      category: snapshot['category'] ?? '',
      dateTask: snapshot['dateTask'] ?? '',
      timeTask: snapshot['timeTask'] ?? '',
      isDone: snapshot['isDone'] ?? false,
    );
  }
}
