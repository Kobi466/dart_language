import 'package:first_app/models/todo_model.dart';
import 'package:first_app/services/todo_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier{
  List<Todo> _todos = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchTodos() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try{
      _todos = await TodoService.fetchTodos();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}