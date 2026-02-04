import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  int cartCount = 0;

  void addToCart() {
    cartCount++;
    notifyListeners();
  }
  void removeFromCart() {
    cartCount--;
    notifyListeners();
  }
}