import 'package:e_commerce/components/my_drawer.dart';
import 'package:e_commerce/components/my_product_tile.dart';
import 'package:e_commerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[600],
        title: Text(
          "Shop Page",
        ),
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      // Drawer of black menu draw
      drawer: MyDrawer(),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          //shop substitle
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              'Pick from a selected list of a premium products',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
          //product list

          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //get each individual product from shop
                final product = products[index];

                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
