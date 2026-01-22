import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool isLogin = false;

  void login() {
    isLogin = true;
    notifyListeners();
  }
  void logout() {
    isLogin = false;
    notifyListeners();
  }
}