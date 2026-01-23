import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
          body: Column(
            children: [
              const SizedBox(height: 40,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  ),
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        )
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Text("Kobi Loi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
      ),
    );
  }

}