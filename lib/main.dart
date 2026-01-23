import 'package:first_app/app.dart';
import 'package:first_app/providers/todo_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider())
      ],
      child: MyApp(),
    )
  );
}