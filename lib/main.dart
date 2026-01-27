import 'package:first_app/maintab_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainTabScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            selectColor(context);
          },
          child: const Text('Go to Detail Screen'),
        ),
      ),
    );
  }

  void selectColor(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ColorScreen()
      ),
    );
    print(result);
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go to Home Screen'),
        ),
      ),
    );
  }
}

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color Screen'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Red'),
              onTap: (){
                Navigator.pop(context, Colors.red);
              }
            ),
            ListTile(
              title: const Text('Green'),
              onTap: (){
                Navigator.pop(context, Colors.green);
              }
            ),
            ListTile(
              title: const Text('Blue'),
              onTap: (){
                Navigator.pop(context, Colors.blue);
              }
            ),
          ],
        )
    );
  }
}