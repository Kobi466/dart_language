import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CartPage(),
      ),
    )
  );
}
class CartProvider extends ChangeNotifier{
  int itemCount = 0;
  double totalPrice = 0;

  void addItem() {
    itemCount++;
    totalPrice += 10;
    notifyListeners();
  }

  void removeItem() {
    itemCount--;
    totalPrice -= 10;
    notifyListeners();
  }
}

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Row(
          children: [
            Column(
              children: [
                Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    return Row(
                      children: [
                        // child!,//no rebuild
                        Text("Item Count: ${cart.itemCount}"),
                      ],
                    );
                  },
                ),
                Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    if (cart.itemCount > 0) {
                      return Text("Total Price: ${cart.totalPrice}");
                    }
                    return Text("Total Price: 0");
                  },
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  child: Text(
                    "Add Item"
                  ),
                  onPressed: (){
                    context.read<CartProvider>().addItem();
                  },
                ),
                ElevatedButton(
                  child: Text(
                    "Remove Item",
                  ),
                  onPressed: (){
                    context.read<CartProvider>().removeItem();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

