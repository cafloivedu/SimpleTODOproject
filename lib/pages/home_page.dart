import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/model/todo2.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _popUp, tooltip: 'Add task', child: new Icon(Icons.add)),
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
            //_item.removeAt(index);
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
          child: Card(
            color:
                element.completed == 1 ? Colors.blue[200] : Colors.yellow[200],
            child: ListTile(
              title: _item(element, posicion),
              subtitle: Text(""),
            ),
          ),
        );
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Text('$posicion');
  }

  void _addTodo() {
    setState(() {
      todos.add(new Todo(title: "itemT", body: "itemB", completed: 0));
    });
  }

  void _popUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.yellow[200],
            title: Text(
              'New todo',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20.0),
            ),
            content: Form(
              key: _formKey,
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
                  // Expanded(
                  //   child: TodoTypeDropdown,
                  // )
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
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // void _onTap(BuildContext context, Todo location, int posicion) {
  //   setState(() {
  //     if (this.widget.todos[posicion].completed == 0) {
  //       this.widget.todos[posicion].completed = 1;
  //     }
  //   });
  // }
}
