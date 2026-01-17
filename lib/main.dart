import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tan loi"),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: MyWidgetStateFul(),
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
class MyWidgetStateFul extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Build();
  }
}
class Build extends State<MyWidgetStateFul>{
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
    return form();
  }
  Padding input(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "User Name",
              hintText: "Enter your name",
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              InkWell(
                child: Text("Don't have an account?"),
                onTap: (){

                },
              ),
              SizedBox(width: 100),
              ElevatedButton(
                  onPressed: (){
                    print(controller.text);
                  },
                  child: Text("Login")
              ),
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){

                },
                child: Text("Register")
            ),
          ),
          SizedBox(height: 10,),
          //Search
          TextField(
            onChanged: (value){
              print(value);
            },
          )
        ],
      ),
    );
  }
  Widget form(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                  v != null && v.contains('@') ? null : "Email is not valid",
                ),
                SizedBox(height: 10,),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                  v != null && v.length >= 6 ? null : "Password is not valid",
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        print(AutofillHints.username);
                        print(AutofillHints.password);
                      }
                    },
                    child: Text("Login")
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

