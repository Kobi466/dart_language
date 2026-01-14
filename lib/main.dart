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
    // TODO: implement build
    // if (loading) {
    //   return const CircularProgressIndicator();
    // } else {
    //   return const Text("Stateless Widget");
    // }
    return const Text("Nhớ năm đó tôi đỏ mắt nhìn những người được tiêm vaccine"
        " phai zơ, còn tôi phải tiêm vê rô seo, bây giờ thì...hẹ hẹ hẹ ",
      // textDirection: TextDirection.ltr,
      textAlign: TextAlign.justify,
      // maxLines: 3,
      // overflow: TextOverflow.ellipsis,
      // textScaleFactor: 1,
      style: TextStyle(
        fontSize: 24,
        color: Colors.orange,
        // background:Colors.white10,
        // fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontFamily: "Times New Roman",
        // height: 2,
        letterSpacing: 0,
        // wordSpacing: 20,
        // decoration: TextDecoration.underline,
        // decorationColor: Colors.cyanAccent,
        // decorationStyle: TextDecorationStyle.solid
      ),
    );
  }
}
