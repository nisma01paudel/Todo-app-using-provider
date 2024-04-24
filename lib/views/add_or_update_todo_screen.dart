import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/todoprovider.dart';
import '../models/todo.dart';

class AddUpdateTodoScreen extends StatelessWidget {
  bool isUpdated;
  int indexno;
  AddUpdateTodoScreen(this.isUpdated, {this.indexno = 0});

  @override
  Widget build(BuildContext context) {
    final todoprovider = Provider.of<ToDoProvider>(context);
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController descriptioncontroller = TextEditingController();

    ToDo todo = ToDo("", "");
    if (isUpdated) {
      todo = todoprovider.todos[indexno];
      titlecontroller.text = todo.tittle;
      descriptioncontroller.text = todo.description;
    }
    // Prompt user to enter a task

    return Scaffold(
      appBar: AppBar(title: isUpdated ? Text('Update Todo') : Text("Add Todo")),
      body: Column(
        children: [
          TextFormField(
            controller: titlecontroller,
            decoration: InputDecoration(
              labelText: 'Enter task',
            ),
          ),
          TextFormField(
            controller: descriptioncontroller,
            decoration: InputDecoration(
              labelText: 'Enter description',
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (isUpdated) {
                ToDo todo =
                    ToDo(titlecontroller.text, descriptioncontroller.text);
                todoprovider.updateTodo(indexno, todo);
                Navigator.pop(context);
              } else {
                ToDo todo =
                    ToDo(titlecontroller.text, descriptioncontroller.text);
                todoprovider.addtodo(todo);
                Navigator.pop(context);
              }
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
