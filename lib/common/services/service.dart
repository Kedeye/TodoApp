import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/model.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Task>> getTasks() {
    return _firestore.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Task(
          type: data['type'],
          title: data['title'],
          status: data['status'],
          progress: data['progress'],
          startDate: data['startDate'],
          endDate: data['endDate'],
        );
      }).toList();
    });
  }
}
