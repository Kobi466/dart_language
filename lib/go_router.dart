import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
      GoRoute(
        path: '/detail/:id/:name',
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          final name = state.pathParameters['name']!;
          return DetailScreen(id: int.parse(id), name: name);
        },
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/detail/123/Flutter');
          },
          child: Text('Go to Detail Screen'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.id, required this.name});
  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(id.toString(), style: const TextStyle(fontSize: 24)),
            Text(name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
