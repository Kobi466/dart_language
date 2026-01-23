import 'dart:convert';

import 'package:first_app/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/todos";
  static Future<List<Todo>> fetchTodos() async{
    final response  = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map(
          (e) => Todo.formJson(e)
      ).toList();
    } else {
      throw Exception("Failed to load todos");
    }
  }
}