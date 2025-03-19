import 'package:flutter/material.dart';
import 'package:shop/productjson.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> cart = [];
  void addProduct(CartModel product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(CartModel product) {
    cart.remove(product);
    notifyListeners();
  }
}
