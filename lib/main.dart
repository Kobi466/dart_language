import 'package:first_app/todo_model.dart';
import 'package:first_app/todo_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API Demo",
      debugShowCheckedModeBanner: false,
      home: _TodoScreen(),
    );
  }
}
class _TodoScreen extends StatefulWidget{
  @override
  State<_TodoScreen> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<_TodoScreen>{
  bool _loading = true;
  String? errorMessage;
  List<Todo> todos = [];
  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async{
    try {
      final data = await TodoService.fetchTodos();
      todos = data;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      _loading = false;
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    //loading
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }  
    //error
    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Todos"),),
        body: Text(
          errorMessage!,
          style: TextStyle(
            color: Colors.red
          ),
        )
      );
    }

    //data
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            leading: Icon(
              todo.completed ? Icons.check_circle
                  : Icons.circle_outlined,
              color: todo.completed ? Colors.green
                  : Colors.grey,
            ),
            title: Text(
              todo.title,
            ),
          );
        },
      ),
    );
  }
}