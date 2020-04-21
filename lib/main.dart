import 'package:flutter/material.dart';
import 'package:firstflutterapp/screens/Home.screen.dart';
import 'package:firstflutterapp/screens/AddTask.screen.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(App());

class ToDoState {
  BehaviorSubject _arr2 = BehaviorSubject.seeded([
    {'title': 'Task 1', 'createDate': new DateTime.now()},
    {'title': 'Task 2', 'createDate': new DateTime.now()},
    {'title': 'Task 3', 'createDate': new DateTime.now()}
  ]);

  Stream get stream$ => _arr2.stream;

  get current => _arr2.value;

  addTask(text) {
    _arr2.add([
      ...current,
      {'title': '$text', 'createDate': new DateTime.now()}
    ]);
  }

  removeTask(index) {
    current.removeAt(index);
    _arr2.add([...current]);
  }
}

final toDoService = ToDoState();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      color: Colors.red,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MyHome(),
        '/addTask': (BuildContext context) => AddTask(),
      },
    );
  }
}

//class Test222 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'Todo List',
//        color: Colors.red,
//        home: Scaffold(
//          appBar: AppBar(),
//          floatingActionButton: FloatingActionButton(onPressed: () => counterService.addTask(),),
//          body: StreamBuilder(
//            stream: counterService.stream$,
//            builder: (BuildContext context, AsyncSnapshot snap) {
//              return ListView.builder(itemBuilder: (BuildContext, index) {
//                if(index < snap.data.length)
//                return ListTile(title: Text(snap.data[index]),);
//              });
//            },
//          ),
//        ));
//  }
//}

//This is common usage state of app//

//class _AppWithState extends State<App> {
//  List<String> _arr = ["Test1", "Test2", "Test3"];
//
//  void addTask(text) {
//    setState(() {
//      _arr.add(text);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Todo List',
//      color: Colors.red,
//      routes: <String, WidgetBuilder>{
//        '/': (BuildContext context) => MyHome(list: _arr),
//        '/addTask': (BuildContext context) => AddTask(addTask: addTask),
//      },
//    );
//  }
//}
