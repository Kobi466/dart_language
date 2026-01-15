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
    return Container(
      // color: Colors.cyanAccent,
      height: 100,
      width: 200,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      // child: const Text(
      //     "Loi Kobi",
      //   style: TextStyle(
      //     fontSize: 24
      //   ),
      // ),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(9)),
        border: Border.all(width: 2, color: Colors.cyanAccent),
      ),
        transform: Matrix4.rotationZ(1)
    );
  }
}
