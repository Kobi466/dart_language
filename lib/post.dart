import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: PostScreen(),
        ),
      ),
    );
  }
}

class PostScreen extends StatelessWidget{
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/100"),
            ),
            const SizedBox(width: 8,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("12:34 PM", style: TextStyle(color: Colors.grey),),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8,),
        Text("This is a post", style: TextStyle(fontSize: 16),),
        const SizedBox(height: 5,),
        Image.network(
          "https://picsum.photos/400/300",
        ),
        const SizedBox(height: 12,),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: (){},
              icon: Icon(Icons.favorite, color: Colors.black54,),
              label: Text("100", style: TextStyle(color: Colors.black54),),
            ),
            TextButton.icon(
              onPressed: (){},
              icon: Icon(Icons.chat_bubble, color: Colors.black54,),
              label: Text("100", style: TextStyle(color: Colors.black54),),
            ),
            TextButton.icon(
              onPressed: (){},
              icon: Icon(Icons.share, color: Colors.black54,),
              label: Text("100", style: TextStyle(color: Colors.black54),),
            ),
          ],
        )
      ],
    );
  }
}