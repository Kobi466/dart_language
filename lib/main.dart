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
      margin: EdgeInsets.all(30),
      child: ElevatedButton.icon(
          onPressed: (){
            print("Elevated Button");
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            minimumSize: const Size(240, 80),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30)
            ),
            elevation: 30,
            shadowColor: Colors.black,
            side: BorderSide(width: 2, color: Colors.black)
          ),
          icon: Icon(Icons.one_k_plus_outlined, size: 30,),
          label: Text(
              "Elevated Button",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Times New Roman",
            ),
          )
      ),
    );
  }
}
