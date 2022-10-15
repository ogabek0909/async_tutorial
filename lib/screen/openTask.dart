import 'dart:ui';

import 'package:async_tutorial/screen/todoList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'todo.dart';

class OpenTask extends StatefulWidget {
  List<Todo> a = [];
  int index = 0;
  OpenTask({super.key, this.a = const [], this.index = 0});

  @override
  State<OpenTask> createState() => _OpenTaskState();
}

  TextEditingController descriptionController = TextEditingController(text: '');
class _OpenTaskState extends State<OpenTask> {

  @override
  Widget build(BuildContext context) {
    descriptionController.text = task[widget.index].description;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.a[widget.index].title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                maxLines: 18,
                controller:descriptionController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Colors.grey.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 4, color: Colors.black)),
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  
                    Todo replace=Todo(
                        title: task[widget.index].title,
                        description: descriptionController.text,
                        status: task[widget.index].status,
                        color_todo: task[widget.index].color_todo);
                    Navigator.pop(context,replace);
                 
                },
                child: Text('change'))
          ],
        ),
      ),
    );
  }
}
