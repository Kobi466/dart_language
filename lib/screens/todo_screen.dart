import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class TodoScreen extends StatefulWidget{
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() {
    return TodoScreenState();
  }
}

class TodoScreenState extends State<TodoScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask( () =>
      context.read<TodoProvider>().fetchTodos()
    );
  }
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo Provider"
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: provider.fetchTodos,
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } 
          if (provider.errorMessage != null) {
            return Center(
              child: Text(
                provider.errorMessage.toString(),
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              final todo = provider.todos[index];
              return Expanded(
                child: ListTile(
                  title: Text(
                  todo.title.toString(),
                  ),
                  trailing: Icon(
                    todo.completed ? Icons.check_circle
                        : Icons.circle_outlined
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}