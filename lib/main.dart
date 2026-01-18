import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tan loi"),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: MyWidgetStateFul(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.eighteen_up_rating_sharp),
                label: "Home",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(fontFamily: "Freedom-10eM"),
      darkTheme: ThemeData.dark(),
    ),
  );
}

// class MyWidgetStateLess extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: "User Name",
//           hintText: "Enter your name",
//           prefixIcon: Icon(Icons.person),
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
class MyWidgetStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Build();
  }
}

class Build extends State<MyWidgetStateFul> {
  final controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return pageViewBuilder();
  }

  SingleChildScrollView scrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Title"),
          SizedBox(height: 20),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Submit")),
        ],
      ),
    );
  }

  ListView listView() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Tên'),
          subtitle: Text('Mô tả'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  ListView listViewBuilder() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Item $index'));
      },
    );
  }

  ListView listViewSeparated() {
    return ListView.separated(
      itemBuilder: (_, _) => Divider(),
      separatorBuilder: (_, index) {
        return ListTile(title: Text("Item $index"));
      },
      itemCount: 100,
    );
  }

  GridView gridPermanent() {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
        Text("dsad"),
      ],
    );
  }

  GridView gridOptimal() {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.lightBlue,
          margin: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Item $index",
              style: TextStyle(
                color: Colors.green
              ),
            ),
          ),
        );
      },
    );
  }

  PageView pageSwipe() {
    return PageView(
      children: [
        Container(color: Colors.green,),
        Container(color: Colors.lightBlue,),
        Container(color: Colors.redAccent,),
      ],
    );
  }
  //horizontal and vertical
  PageView pageViewBuilder(){
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index){
        return Text(
          "Page $index",
          style: TextStyle(
            fontSize: 24
          ),
        );
      },
    );
  }

  RefreshIndicator refreshIndicator() {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (_, i) => Text('Item $i'),
      ),
      onRefresh: () async {
        print('Reload data');
      },
    );
  }
}
