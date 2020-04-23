import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstflutterapp/services/toDo.service.dart';
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
    var time = DateFormat.jm().format(new DateTime.now());
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
          child: list == 0
              ? Center(
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 7.0,
                    ),
                  ),
                )
              : list.length == 0 ? Center(child: Text('List is empty'),) : ListView.builder(itemBuilder: (context, index) {
                  if (index < list.length) {
                    return _buildAllList(list[index]['name'],
                        list[index]['createdAt'], index, context);
                  }
                }),
        ),
      ],
    );
  }
}
