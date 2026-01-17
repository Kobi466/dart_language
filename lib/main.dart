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
    return Column(
      children: [
        Row(
          children: [
            Flexible(child: Text('Một đoạn text rất rất rất dài')),
            Icon(Icons.star),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text('Một đoạn text rất rất rất dài')),
            Icon(Icons.star),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            Icon(Icons.star),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                color: Colors.amber,
                height: 100,
                // width: 800,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Icon(Icons.star),
            ),
          ],
        ),
      ],
    );


  }
}
