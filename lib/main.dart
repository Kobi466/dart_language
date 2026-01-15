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
      margin: EdgeInsets.all(20),
      child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
            // foregroundColor: Colors.redAccent,
            // backgroundColor: Colors.cyan,
            // // minimumSize: const Size(120, 120)
            // padding: EdgeInsets.all(40),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadiusGeometry.circular(20),
            // ),
            // elevation: 50,
            // shadowColor: Colors.deepPurple,
            // side: BorderSide(width: 2, color: Colors.white10)
            disabledBackgroundColor: Colors.red,
            disabledForegroundColor: Colors.black
          ),
          // icon: Icon(Icons.fax_rounded, size: 24,),
          child: const Text(
            "Text Button",
            style: TextStyle(
              fontSize: 28,
              fontFamily: "Times New Roman",
            ),
          )
      ),
    );
  }
}
