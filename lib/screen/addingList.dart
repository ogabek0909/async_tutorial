import 'package:async_tutorial/screen/todo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingList extends StatelessWidget {
  AddingList({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding new task'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 3,
                      )),
                  filled: true,
                  fillColor: Colors.white70,
                  labelText: 'Input title of your task',
                  labelStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: descriptionController,
              maxLines: 7,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 3,
                      )),
                  labelStyle: TextStyle(fontSize: 22),
                  labelText: 'Input description of your task',
                  border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 83, 231, 90),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
              onPressed: () {
                Todo task = Todo(
                    title: titleController.text,
                    description: descriptionController.text,
                    status: false,
                    color_todo: Colors.green);
                if (task.title.isNotEmpty){
                  Navigator.pop(context,task);
                }
              },
              child: Text(
                'Add new task',
                style: GoogleFonts.merriweather(fontSize: 25),
              ))
        ],
      ),
    );
  }
}
