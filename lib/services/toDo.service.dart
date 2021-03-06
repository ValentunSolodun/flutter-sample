import 'package:rxdart/rxdart.dart';

class ToDoState {
  BehaviorSubject _arr2 = BehaviorSubject.seeded(0);

  Stream get stream$ => _arr2.stream;

  get current => _arr2.value;

  setDataFromAPI(data) {
    _arr2.add([...data]);
  }

  void addTask(item) {
    _arr2.add([
      ...current,
      item
    ]);
  }

  void removeTask(index) {
    current.removeAt(index);
    _arr2.add([...current]);
  }
}

final toDoService = ToDoState();
