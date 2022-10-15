import 'package:async_tutorial/screen/todoList.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: TodoList(),
      ),
    )
  );
}