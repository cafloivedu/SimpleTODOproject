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
      content: Column(children: <Widget>[
        FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      ])
    );
  }
}asas