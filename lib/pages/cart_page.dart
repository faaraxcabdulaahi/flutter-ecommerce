import 'package:e_commerce/components/my_button.dart';
import 'package:e_commerce/components/my_drawer.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove item from cart
  void removeitemFromCart(BuildContext context, Product product) {
    //Show a dailog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item to your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          //yes button
          MaterialButton(
            onPressed: () {
              //pop dailog
              Navigator.pop(context);
              //add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User wants to pay! connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          //Cart list
          Expanded(
            child: cart.isEmpty
                ? Text("Your cart is empty...")
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      //return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeitemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),
          //pay button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Text("PAY NOW"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
