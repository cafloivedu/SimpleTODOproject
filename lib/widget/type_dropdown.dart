import 'package:flutter/material.dart';

class TodoTypeDropdown extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;

  const TodoTypeDropdown(
      {Key key, @required this.selected, @required this.onChangedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: this.selected,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.brown,
            ),
            iconSize: 24,
            //elevation: 16,
            style: TextStyle(color: Colors.brown),
            underline: Container(
              height: 2,
              color: Colors.brown,
            ),
            onChanged: this.onChangedValue,
            items: <String>['Default', 'Call', 'HomeWork']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
