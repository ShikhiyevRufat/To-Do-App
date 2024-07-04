import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/model/to_do_model.dart';

class ToDoService {
  final toDoCollection = FirebaseFirestore.instance.collection('todoApp');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get currentUserId => _auth.currentUser?.uid;

  void addNewTask(ToDoModel model) {
    final uid = currentUserId;
    if (uid != null) {
      toDoCollection.add(model.toMap()..['userId'] = uid);
    } else {
      print("Error: No user logged in to add task.");
    }
  }

  void updateTask(String? docID, bool? valueUpdate) {
    final uid = currentUserId;
    if (uid != null) {
      toDoCollection.doc(docID).update({
        'isDone': valueUpdate,
      });
    }
  }

  void deleteTask(String? docID) {
    final uid = currentUserId;
    if (uid != null) {
      toDoCollection.doc(docID).delete();
    }
  }
}
