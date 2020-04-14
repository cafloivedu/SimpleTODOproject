import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/model/todo2.dart';
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

  Widget _list(){
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
                )
              );
            },
            
            background: Container(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Eliminar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.redAccent, 
            ),
            
            secondaryBackground: Container(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("Eliminar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.redAccent, 
            ),

            
            child: Card(
              color: element.completed == 1 ? Colors.blue[200]:Colors.yellow[200],
              child: ListTile(
                title: _item(element, posicion),
                subtitle: Text(""),
              ),
            ),
          );
      },
    );
  }

  Widget _item(Todo element, int posicion){
    return Text('$posicion');
  }

  void _addTodo(){
    setState(() {
      todos.add(new Todo(title:"itemT", body: "itemB", completed: 0 ));
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