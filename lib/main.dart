import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tan loi"),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: MyWidget(),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.eighteen_up_rating_sharp), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ])
        ),
    ),
    debugShowCheckedModeBanner: false,
    title: "Flutter Demo",
    theme: ThemeData(
      fontFamily: "Freedom-10eM",
    ),
    darkTheme: ThemeData.dark(),
  ));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyanAccent,
      margin: EdgeInsets.all(20),
      child: Padding(
        // padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10, top: 10),
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
        child: Text(
          "kobi",
          style: TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
