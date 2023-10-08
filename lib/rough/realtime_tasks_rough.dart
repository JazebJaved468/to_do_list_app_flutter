

// ======================== Firestore Practice in separate Screen =========================


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_list/screens/task_screen.dart';

// import '../services/firestore.dart';

// class RealTimeTasks extends StatefulWidget {
//   const RealTimeTasks({super.key});

//   @override
//   State<RealTimeTasks> createState() => _RealTimeTasksState();
// }

// class _RealTimeTasksState extends State<RealTimeTasks> {
//   // firestore services Object
//   final FirestoreServices firestoreService = FirestoreServices();

//   //controller
//   TextEditingController updateTaskController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: updateTaskController,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ListApp()),
//               );
//             },
//             icon: Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: firestoreService.readTasks(),
//         builder: (context, snapshot) {
//           // if we have data get all the tasks
//           if (snapshot.hasData) {
//             final taskList = snapshot.data!.docs;
//             print(
//                 " ================================================Task List = ${snapshot.data!.docs}");
//             // displaying all tasks as a list
//             return ListView.builder(
//               itemCount: taskList.length,
//               itemBuilder: (context, index) {
//                 // get each individual task
//                 DocumentSnapshot task = taskList[index];
//                 print("task = ${task}");

//                 // get task id
//                 String taskID = task.id;
//                 print("task id hai ye = ${task.id}");

//                 // get data of each task
//                 Map<String, dynamic> data = task.data() as Map<String, dynamic>;

//                 // get task content
//                 String content = data['content'];

//                 // get task timestamp
//                 final timeStamp = data['timeStamp'];

//                 // Showing in List tile
//                 return ListTile(
//                   title: Text(content),
//                   subtitle: Text(" $timeStamp"),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       //edit
//                       IconButton(
//                         onPressed: () {
//                           firestoreService.updateTask(
//                               taskID, updateTaskController.text);
//                         },
//                         icon: Icon(Icons.edit),
//                       ),

//                       // delete
//                       IconButton(
//                         onPressed: () {
//                           firestoreService.deleteTask(
//                               taskID);
//                         },
//                         icon: Icon(Icons.delete),
//                       ),
                
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
