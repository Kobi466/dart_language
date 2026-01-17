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
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  "UserName:",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Nguyen van A",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  "Email:",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "NguyenA@gmail.com",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  "Address:",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Da Nang",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed:(){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white10,
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                  )
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: ElevatedButton(
                      onPressed:(){},
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}
