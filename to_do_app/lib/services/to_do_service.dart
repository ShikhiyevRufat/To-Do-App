import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/to_do_model.dart';

class ToDoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNewTask(ToDoModel task) async {
    final docRef = await _firestore.collection('users').doc(task.uid).collection('tasks').add(task.toJson());
    await docRef.update({'taskId': docRef.id});
  }

  void updateTask(String uid, String taskId, bool? isDone) {
    _firestore.collection('users').doc(uid).collection('tasks').doc(taskId).update({'isDone': isDone});
  }

  void deleteTask(String userId, String taskId) {
    _firestore.collection('users').doc(userId).collection('tasks').doc(taskId).delete();
  }

  Stream<List<ToDoModel>> fetchTasks(String uid) {
    return _firestore.collection('users').doc(uid).collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ToDoModel.fromFirestore(doc)).toList();
    });
  }
}
