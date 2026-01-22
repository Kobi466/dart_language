import 'package:first_app/state/providers/auth_provider.dart';
import 'package:first_app/state/providers/theme_provider.dart';
import 'package:first_app/state/screens/home_screen.dart';
import 'package:first_app/state/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final authProvider = context.watch<AuthProvider>();

    return MaterialApp(
      theme: themeProvider.isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      home: authProvider.isLogin
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
