import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/model/to_do_model.dart';
import 'package:to_do_app/services/to_do_service.dart';

final serviceProvider = StateProvider<ToDoService>((ref) {
  return ToDoService();
});

final fetchProvider = StreamProvider<List<ToDoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('todoApp')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => ToDoModel.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
