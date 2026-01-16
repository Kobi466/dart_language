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
      color: Colors.amberAccent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: Text(
                "Button 1",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          ),
          Container(
            height: 100,
            child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                child: Text(
                  "Button 2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: Text(
                "Button 3",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          ),
          // Icon(Icons.star),
          // Spacer(),
          // SizedBox(width: 20),
          // Expanded(
          //   child: Text("ccccccccccccccccccccccccccccccccccccccc"
          //       "ccccccccccccccccccccccccccccccccccccccc"
          //       "ccccccccccccccccccccccccccccccccccccccc"
          //       "ccccccccccccccccccccccccccccccccccccccc"
          //       "ccccccccccccccccccccccccccccccccccccccc"
          //       "ccccccccccccccccccccccccccccccccccccccc"
          //       "ccccccccccccccccccccccccccccccccccccccc",
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
          // SizedBox(width: 20),
          // Flexible(
          //   child: Text('Đây là một đoạn text rất rất rất dài '
          //       'ccccccccccccccccccccccccccccccccccccccc'
          //       'ccccccccccccccccccccccccccccccccccccccc'
          //       'ccccccccccccccccccccccccccccccccccccccc'
          //       'ccccccccccccccccccccccccccccccccccccccc',
          //     // overflow: TextOverflow.ellipsis,
          //   ),
          // ),
        ],
      ),
    );
  }
}
