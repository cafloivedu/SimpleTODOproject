import 'package:flutter/material.dart';

Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: null,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Rewind and remember'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You will never be satisfied.'),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}