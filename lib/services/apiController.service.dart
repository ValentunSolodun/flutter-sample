import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firstflutterapp/services/toDo.service.dart';

const host = 'http://10.0.2.2:3001';

Future myFetch(String url, String type, Map body) async {
  Map crudTypes = {
    'get': http.get,
    'post': http.post,
    'delete': http.delete,
    'put': http.put
  };

  try {
    if (body.isNotEmpty) {
      return await crudTypes[type](url, body: {...body});
    } else if (body.isEmpty) {
      return await crudTypes[type](url);
    }
  } catch (e) {
    throw Exception('Request has failde');
  }
}

class ApiController {
  void getTodos() async {
    final response = await myFetch(host, 'get', {});
    final data = await json.decode(response.body);
    toDoService.setDataFromAPI(data);
  }

  void addToDo(name) async {
    final response = await myFetch(host, 'post', {'name': name});
    final data = await json.decode(response.body);
    toDoService.addTask(data);
  }

  void removeToDo(index, id) async {
    await myFetch('$host/$id', 'delete', {});
    toDoService.removeTask(index);
  }
}

final MyApiController = ApiController();
