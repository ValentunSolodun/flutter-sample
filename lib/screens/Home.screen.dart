import 'package:flutter/material.dart';
import 'package:firstflutterapp/widgets/AppBar.widget.dart';
import 'package:firstflutterapp/widgets/List.widget.dart';
import 'package:firstflutterapp/main.dart';

class MyHome extends StatelessWidget {
//  final List<dunamic> list;
//
//  MyHome({@required this.list});

  addTask(BuildContext context) {
    return Navigator.of(context).pushNamed('/addTask');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Flutter To Do List'),
      body: StreamBuilder(
        stream: toDoService.stream$,
        builder: (BuildContext context, AsyncSnapshot snap) {
          return ListWidget(list: snap.data);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addTask(context),
      ),
    );
  }
}
