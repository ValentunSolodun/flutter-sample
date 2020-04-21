import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstflutterapp/main.dart';
import 'package:intl/intl.dart';

class ListWidget extends StatelessWidget {
  final list;

  ListWidget({@required this.list});

  void _showDialog(context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Remove this task?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: Text("Remove"),
              onPressed: () {
                Navigator.of(context).pop();
                toDoService.removeTask(index);
              },
            ),
          ],
        );
      },
    );
  }

//  removeTaskHandler(index) {
//    toDoService.removeTask(index);
//  }

  Widget _buildAllList(text, date, index, context) {
    var time = DateFormat.jm().format(date);
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(time, style: TextStyle(fontSize: 15)),
        ],
      ),

      subtitle: RaisedButton(
        child: Text('remove'),
        onPressed: () => _showDialog(context, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            if (index < list.length) {
              return _buildAllList(list[index]['title'], list[index]['createDate'], index, context);
            }
          }),
        ),
      ],
    );
  }
}
