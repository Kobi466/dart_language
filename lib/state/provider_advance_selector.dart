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
                Selector<CartProvider, int>(
                  selector: (context, cart) => cart.itemCount,
                  builder: (context, itemCount, child) {
                    return Text("Item Count: $itemCount");
                  },
                ),
                Selector<CartProvider, double>(
                  selector: (context, cart) => cart.totalPrice,
                  builder: (context, totalPrice, child) {
                    return Text("Total Price: $totalPrice");
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

