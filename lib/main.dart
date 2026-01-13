import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text("Flutter Demo"),
          //   backgroundColor: Colors.orange,
          // ),
          // body: const Center(
          //   child: Text("Hello Flutter"),
          // ),
          body: Center(child: MyWidget2(false)),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ])
        ),
    ),
    debugShowCheckedModeBanner: false,
    title: "Flutter Demo",
    theme: ThemeData.dark(),
  ));
}

class MyWidget extends StatelessWidget {

  final bool loading;

  MyWidget(this.loading);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // if (loading) {
    //   return const CircularProgressIndicator();
    // } else {
    //   return const Text("Stateless Widget");
    // }
    return loading ? const CircularProgressIndicator() : const Text("Stateless Widget");
  }
}

class MyWidget2 extends StatefulWidget {
  final bool loading;

  MyWidget2(this.loading);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyWidget2State();
  }
}

class MyWidget2State extends State<MyWidget2> {

  late bool _localLoading;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _localLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _localLoading ? const CircularProgressIndicator() : FloatingActionButton(onPressed: onClickButton);
  }
  void onClickButton(){
    setState(() {
      _localLoading = true;
    });
  }
}