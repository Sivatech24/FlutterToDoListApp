import 'package:flutter/material.dart';

void main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo List App',
      home: TodoList(),
    );
  }
}
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  List<String> tasks= [];
  TextEditingController taskController=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter The Task',
                     ),
                   ),
                  ),
                  IconButton(
                    icon:Icon(Icons.add),
                    onPressed:(){
                    addTask();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(icon: Icon(Icons.delete),
                    onPressed: (){
                      deleteTask(index);
                    },
                    ),
                  );
                }, 
              ),
            ),
      ],
      ),
    );
  }
  void addTask(){
    String task = taskController.text.trim();
    if(task.isNotEmpty){
      setState((){
        tasks.add(task);
      });
      taskController.clear();
    }
  }
  void deleteTask(int index){
    setState((){
      tasks.removeAt(index);
    });
  }
}