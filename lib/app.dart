import 'package:first_app/providers/auth_provider.dart';
import 'package:first_app/ui/home_page.dart';
import 'package:first_app/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthProvider>(
        builder: (_, auth, _) {
          if (!auth.isLoggedIn) {
            return LoginPage();
          }
          if (!auth.hasProfile) {
            return Scaffold(
              body: CircularProgressIndicator(),
            );
          } else {
            return HomePage(
              profileModel: auth.profile!,
            );
          }
        },
      ),
      navigatorObservers: [],
    );
  }
}
