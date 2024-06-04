import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {

 List toDoList = [];
  // refence our box

  final _myBox = Hive.box('mybox');


  void createInitialData(){
    toDoList =[
      ['Task 1', false],
      ['Task 2', false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}