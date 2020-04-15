import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  NewTodoDialogState createState() => NewTodoDialogState();
}

class NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New todo',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Form(
        //key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              //controller: controllerTitle,
              autofocus: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Body',
              ),
              //controller: controllerTitle,
              autofocus: true,
            ),
            /* Expanded(
               child: TodoTypeDropdown,
            )*/
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Submit'),
          onPressed: () {
            final todo = new Todo(
                title: "item 1"/*controllerTitle.value.text*/,
                body: controllerBody.value.text,
                completed: 0,);
            controllerTitle.clear();
            controllerBody.clear();

            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
