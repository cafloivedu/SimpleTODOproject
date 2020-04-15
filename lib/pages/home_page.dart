import 'dart:developer';

import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/widget/new_todo.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            todos.removeAt(posicion);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Item dismissed"),
            ));
          },
          background: Container(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Eliminar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.redAccent,
          ),
          secondaryBackground: Container(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Eliminar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.redAccent,
          ),
          child: GestureDetector(
            onTap: () {
              _onTap(context, element, posicion);
            },
            child: Card(
              color: element.completed == 1
                  ? Colors.green[200]
                  : Colors.yellow[200],
              child: ListTile(
                leading: element.completed == 0 ? _getResource(element.type) : Icon(Icons.assignment_turned_in, size: 55.0),
                title: Text(element.title),
                subtitle: Text(element.body),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Text('$posicion');
  }

  _getResource(String type) {
    switch (type) {
      case 'Call':
        return Icon(Icons.call, size: 55.0);
      case 'HomeWork':
        return Icon(Icons.work, size: 55.0);
      default:
        return Icon(Icons.assignment, size: 55.0);
    }
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    //todos.add(new Todo(title: "itemT, body: "itemB", completed: 0));

    if (todo != null) {
      setState(() {
        this.todos.add(todo);
      });
    }
  }

  _onTap(BuildContext context, Todo location, int posicion) {
    setState(() {
      if (this.todos[posicion].completed == 0) {
        this.todos[posicion].completed = 1;
      } else {
        this.todos[posicion].completed = 0;
      }
    });
  }
}
