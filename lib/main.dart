import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tan loi", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            // leading: Icon(Icons.menu),
            actions: [
              IconButton(
                onPressed: () {
                  print("Search");
                },
                icon: Icon(Icons.search),
              ),
            ],
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: Center(child: Text("Hello World")),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.contact_mail_outlined), label: "Contact"),
              BottomNavigationBarItem(icon: Icon(Icons.photo_camera), label: "Camera"),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text('Menu', style: TextStyle(color: Colors.black)),
                ),
                ListTile(title: Text('Home'), leading: Icon(Icons.home)),
                ListTile(title: Text('Setting'), leading: Icon(Icons.settings)),
                ListTile(title: Text('Profile'), leading: Icon(Icons.person)),
              ],
            ),
          ),
          // endDrawer: Drawer(),
          backgroundColor: Colors.tealAccent,
          floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(fontFamily: "Freedom-10eM"),
    ),
  );
}
