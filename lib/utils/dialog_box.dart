

import 'package:flutter/material.dart';
import 'package:todoapp/utils/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onPressed;
   
   DialogBox({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Add New Task",
                  )),
              Row(
                children: [
                  MyButton(text: 'Save', onPressed: () {}),
                  const SizedBox(
                    width: 8,
                  ),
                  MyButton(text: 'Cancel', onPressed: () {})
                ],
              )

              //buttons -> save and cancel
            ],
          )),
    );
  }
}
