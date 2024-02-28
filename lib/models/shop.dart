import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //Products for sale
  final List<Product> _shop = [
    //products 1
    Product(
      name: 'Black hoodie',
      price: 19.9,
      description:
          'This BLACK Hoodie will keep you warm this winter. The Hoodies are made of 100% cotton and pre-washed to prevent shrinkage. ',
      imagePath: 'assets/Jaakad.avif',
    ),
    //products 2
    Product(
      name: 'Protection classes',
      price: 29.9,
      description:
          'This is medical glasses that are used to protect the light that the computer reflects and also sun light protector.',
      imagePath: 'assets/Ookiyaale.jpg',
    ),
    //products 3
    Product(
      name: 'Watch',
      price: 99.9,
      description:
          'The premium watch for legends. Made in india, grabe for before it finishes.',
      imagePath: 'assets/Saacad.avif',
    ),
    //products 4
    Product(
      name: 'Nike shoe',
      price: 9.9,
      description:
          "A pair of nike shoe, last edition for men and women, it's portable so grab your type to be among 1% people in the world, who are healthy.",
      imagePath: 'assets/Kab.avif',
    ),
  ];
  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
