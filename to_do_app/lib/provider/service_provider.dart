import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/model/to_do_model.dart';
import 'package:to_do_app/services/to_do_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final serviceProvider = Provider<ToDoService>((ref) => ToDoService());

final fetchProvider = StreamProvider<List<ToDoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('users')
      .doc(ref.read(firebaseAuthProvider).currentUser!.uid)
      .collection('tasks')
      .snapshots()
      .map((event) =>
          event.docs.map((snapshot) => ToDoModel.fromSnap(snapshot)).toList());
  yield* getData;
});

