import 'dart:io';

import 'package:flutter/material.dart';
import 'package:to_do_list/screens/realtime_tasks.dart';
import 'package:to_do_list/services/firestore.dart';
import 'package:to_do_list/widgets/custom_navbar_widget.dart';

class ListApp extends StatefulWidget {
  const ListApp({super.key});

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  // firestore services Object
  final FirestoreServices firestoreService = FirestoreServices();

  // controllers
  TextEditingController addTaskController = TextEditingController();
  TextEditingController updateTaskController = TextEditingController();
  TextEditingController deleteTaskController = TextEditingController();

  int number = 0;
  bool isUpdate = false;
  bool isadd = false;

  List tasks = [
    "Sample1",
    "Sample2",
    "Sample3",
  ];

  // CRUD Operations
  Future addTask() async {
    String newTask = addTaskController.text;

    if (!(tasks.contains(newTask)) && newTask.isNotEmpty) {
      tasks.add(addTaskController.text);
      isadd = true;

      // adding task to firestore too
      firestoreService.createTask(newTask);
    } else {}
    setState(() {});
  }

  void updateTask(int index) {
    String updatedTask = updateTaskController.text;
    debugPrint(updatedTask);
    if (!(tasks.contains(updatedTask)) && updatedTask.isNotEmpty) {
      tasks[index] = updatedTask;
      isUpdate = true;
    } else {}

    setState(() {});
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    setState(() {});
  }

  // styling variables
  final dialogButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
    foregroundColor: const Color.fromARGB(255, 25, 235, 246),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        foregroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          "To Do List",
          style: TextStyle(
            color: Color.fromARGB(255, 25, 235, 246),
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RealTimeTasks()),
                );
              },
              icon: Icon(Icons.task_sharp))
        ],
      ),
      drawer: const CustomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          addTaskController.clear();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Task"),
                content: TextField(
                  onSubmitted: (a) {
                    addTask();

                    Navigator.pop(context);
                    isadd
                        ? ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              "Task Added Successfully",
                              style: TextStyle(
                                color: Color.fromARGB(255, 25, 235, 246),
                              ),
                            ),
                          ))
                        : addTaskController.text.isEmpty
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Task Can't be Empty",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 25, 235, 246),
                                  ),
                                ),
                              ))
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Task Already Exists",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 25, 235, 246),
                                  ),
                                ),
                              ));
                    addTaskController.clear();
                    isadd = false;
                  },
                  controller: addTaskController,
                  decoration: const InputDecoration(
                    hintText: "Enter Task",
                  ),
                ),
                actions: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: dialogButtonStyle,
                          child: const Text("Cancel"),
                        ),
                        const Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              addTask();

                              Navigator.pop(context);
                              isadd
                                  ? ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        "Task Added Successfully",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 25, 235, 246),
                                        ),
                                      ),
                                    ))
                                  : addTaskController.text.isEmpty
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text(
                                            "Task Can't be Empty",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 25, 235, 246),
                                            ),
                                          ),
                                        ))
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text(
                                            "Task Already Exists",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 25, 235, 246),
                                            ),
                                          ),
                                        ));
                              addTaskController.clear();
                              isadd = false;
                            },
                            style: dialogButtonStyle,
                            child: const Text("Add")),
                      ],
                    ),
                  )
                ],
              );
            },
            barrierDismissible: true,
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 30, 30, 30),
          backgroundColor: const Color.fromARGB(255, 25, 235, 246),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
      body: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 174, 174, 174),
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 1.0,
              offset: Offset(
                0.0, // Move to right 5  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 30, 30, 30),
                    width: 0.3,
                  ),
                ),
              ),
              child: ListTile(
                title: Text('${tasks[index]}'),
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 165, 206, 166),
                      ),
                      onPressed: () {
                        setState(() {
                          updateTaskController.text = tasks[index];
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Update Task"),
                                content: TextField(
                                  controller: updateTaskController,
                                ),
                                actions: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: dialogButtonStyle,
                                          child: const Text("Cancel"),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () {
                                            updateTask(index);
                                            Navigator.pop(context);
                                            isUpdate
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    const SnackBar(
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Task Updated Successfully",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              25,
                                                              235,
                                                              246),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                    duration:
                                                        Duration(seconds: 1),
                                                    content: Text(
                                                      "No tasks updated",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 25, 235, 246),
                                                      ),
                                                    ),
                                                  ));
                                            isUpdate = false;
                                          },
                                          style: dialogButtonStyle,
                                          child: const Text("Update"),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 252, 145, 137),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content: const Text('Are you sure?'),
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: dialogButtonStyle,
                                            child: const Text("Cancel"),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {
                                              deleteTask(index);
                                              Navigator.pop(context);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                duration: Duration(seconds: 1),
                                                content: Text(
                                                  "Task Deleted Successfully",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 25, 235, 246),
                                                  ),
                                                ),
                                              ));
                                            },
                                            style: dialogButtonStyle,
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]);
                            });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
