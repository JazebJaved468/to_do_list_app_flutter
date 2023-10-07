import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
// get collection of tasks
  final CollectionReference tasksCollection =
      FirebaseFirestore.instance.collection('tasks');

// CREATE: add a new task
  Future createTask(String task) async {
    return tasksCollection.add({
      'content': task,
      'timeStamp': Timestamp.now(),
    });
  }

// READ: get task from database
  Stream<QuerySnapshot> readTasks() {
    final all_tasks =
        tasksCollection.orderBy('timeStamp', descending: true).snapshots();

    return all_tasks;
  }

// UPDATE: update task given a doc id
  Future updateTask(String docID, String task) async {
    return tasksCollection.doc(docID).update({
      'content': task,
    });
  }

// DELETE: delete task given a doc id
  Future deleteTask(String docID) async {
    return tasksCollection.doc(docID).delete();
  }
}
