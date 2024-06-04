import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //referencia the hive box
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
   if(_myBox.get("TODOLIST") == null){
     db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }


  // save the new task
  void savetheNewtask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  void createNewTask() {
   showDialog(
    context: context, 
    builder: (context)
   {
    return DialogBox(
      controller: _controller,
      onSave: savetheNewtask,
      onCancel: () => Navigator.of(context).pop()
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text('To Do'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: createNewTask,
          backgroundColor: Colors.yellow[500],
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) => TodoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                )));
  }
}
