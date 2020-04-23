import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firstflutterapp/services/toDo.service.dart';

const host = 'http://10.0.2.2:3001';

class ApiController {
  void getTodos() async {
    final response = await http.get('$host');
    final data = await json.decode(response.body);
    toDoService.setDataFromAPI(data);
  }
}

final MyApiController = ApiController();
