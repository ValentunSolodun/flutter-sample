import 'package:firstflutterapp/services/apiController.service.dart';
import 'package:flutter/material.dart';
import 'package:firstflutterapp/widgets/AppBar.widget.dart';
import 'package:firstflutterapp/services/toDo.service.dart';

class AddTask extends StatelessWidget {
//  final addTask;
//  AddTask({@required this.addTask});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: 'Add task'),
        body: Container(
          margin: const EdgeInsets.only(right: 23, left: 23, top: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                ),
              ),
              RaisedButton(
                onPressed: () => {
                  if(_controller.text != '') {
                    MyApiController.addToDo(_controller.text),
                    Navigator.pop(context),
                  }
                },
                child: Text('Add', style: TextStyle(color: Colors.white)),
                color: Colors.red,
              )
            ],
          ),
        ));
  }
}
