import 'package:async_tutorial/screen/addingList.dart';
import 'package:async_tutorial/screen/openTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

Color color_a = Colors.green;
Color color_b = Colors.red;


List<Todo> task = [
  
 
];

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          color: Colors.white70,
          child: Slidable(
            enabled: true,
            key: ValueKey(task[index]),
            endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(onPressed: (context) => setState(() {
                    task.removeAt(index);
                  }),
                  key:ValueKey(task[index]) ,
                  backgroundColor: Colors.lightGreenAccent,
                  icon: Icons.delete,
                  )
                ]),
            child: ListTile(
              title: Text(
                task[index].title,
                style: TextStyle(color: task[index].color_todo, fontSize: 18),
              ),
              subtitle: Text(task[index].description),
              dense: true,
              onTap: ()async {
                Todo todo = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenTask(
                      a: task,
                      index: index,
                    ),
                  ));
                  setState(() {
                    task.replaceRange(index, index+1, [todo]);
                  });
              },
              
              trailing: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      task[index].status = value!;
                      if (task[index].status) {
                        task[index].color_todo = Colors.red;
                      } else {
                        task[index].color_todo = Colors.green;
                      }
                    });
                  },
                  value: task[index].status),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Todo todo = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddingList()));
          setState(() {
            task.add(todo);
          });
        },
      ),
    );
  }
}
