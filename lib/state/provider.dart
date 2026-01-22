import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => CartProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: HomePage(),
    //   ),
    // ),
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => CartProvider(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => AuthProvide(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: AuthPage(),
    //   ),
    // )
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Stack(
            children: [
              Icon(Icons.shopping_cart),
              if (cart.itemCount > 0)
                Positioned(
                  top: 8,
                  right: 0,
                  child: Text(
                    cart.itemCount.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ),
            ],
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addItem();
              },
              child: Text('Add to cart'),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().removeItem();
              },
              child: Text('Remove from cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartProvider extends ChangeNotifier {
  int itemCount = 0;

  void addItem() {
    itemCount++;
    notifyListeners();
  }

  void removeItem() {
    itemCount--;
    notifyListeners();
  }
}

class AuthProvide extends ChangeNotifier{
  bool isLoggedIn = false;
  bool isLoading = false;

  Future<void> login()async{
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));

    isLoggedIn = true;
    isLoading = false;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvide>();

    return Scaffold(
      body: Center(
        child: auth.isLoading ? CircularProgressIndicator() : auth.isLoggedIn ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logged In'
            ),
            ElevatedButton(
              onPressed: (){
                context.read<AuthProvide>().logout();
              },
              child: Text('Logout'),
            ),
          ],
        ) : ElevatedButton(
          onPressed: (){
            context.read<AuthProvide>().login();
          },
          child: Text('Login'),
        )
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier{
  bool isDark = false;

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: theme.themeMode,
      home: ThemePage(),
    );
  }
  
}

class ThemePage extends StatelessWidget{
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: ElevatedButton(
        onPressed: (){
          context.read<ThemeProvider>().toggleTheme();
        },
        child: Text('Toggle Theme'),
      ),
    );
  }

}


