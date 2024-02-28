import 'package:e_commerce/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header : logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              //shop tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                //pop shop tile
                onTap: () => Navigator.pop(context),
              ),
              //cart tile
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);
                  //go to cart page

                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.restorablePushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
