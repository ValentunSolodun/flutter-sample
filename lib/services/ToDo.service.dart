import 'package:rxdart/rxdart.dart';

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