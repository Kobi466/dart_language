import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterPage(),
  ));
}
class CounterPage extends StatelessWidget{

  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ValueNotifier",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: counter,
            builder: (_, value, _) {
              return Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

}