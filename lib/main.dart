import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tan loi", style: TextStyle(color: Colors.white)),
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
            backgroundColor: Colors.black54,
          ),
          body: HomePage(),
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
          // backgroundColor: Colors.tealAccent,
          floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(fontFamily: "Freedom-10eM"),
    ),
  );
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() {
    return MyWidgetBuild();
  }
}

class MyWidgetBuild extends State<MyWidget> {
  bool isBig = false;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return animatedOpacity();
  }

  GestureDetector gestureDetector() {
    return GestureDetector(
      onDoubleTap: () {},
      onTap: () {},
      onLongPress: () {},
      onHorizontalDragEnd: (_) {},
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black87,
        child: Text('Tap me', style: TextStyle(fontSize: 23, color: Colors.white)),
      ),
    );
  }

  Material material() {
    return Material(
      color: Colors.tealAccent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Padding(padding: const EdgeInsets.all(8.0), child: Text("Button")),
      ),
    );
  }

  GestureDetector animatedContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBig = !isBig;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        width: isBig ? 200 : 100,
        height: 200,
        color: isBig ? Colors.teal : Colors.red,
      ),
    );
  }

  GestureDetector animatedOpacity() {
    return GestureDetector(
      onTap: () {
        setState(() {
          visible = !visible;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: visible ? 1.0 : 0.3,
            duration: const Duration(seconds: 1),
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.blue,
              child: const Text('TAP ME', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ),
          Text("Visible: $visible"),
        ],
      ),
    );
  }

  Hero hero(){
    return Hero(
      tag: "avatar",
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage("assets/images/avatar.jpg"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailPage()),
            );
          },
          child: Hero(
            tag: "avatar",
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
          )
        ),
      ),
    );
  }
}

/// =======================
/// MÀN 2
/// =======================
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(
        child: Hero(
          tag: "avatar",
          child: CircleAvatar(
            radius: 400,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
        ),
      ),
    );
  }
}
