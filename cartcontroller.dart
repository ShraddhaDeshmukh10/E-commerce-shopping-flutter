import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:commerceapp/Model/product.dart'; // Import your product model

class CartController extends GetxController {
  final RxList<Product> cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
    update(); // Refreshes the UI when cart items change
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    update(); // Refreshes the UI when cart items change
  }

  double getTotalAmount() {
    double total = 0;
    for (var product in cartItems) {
      total += product.price;
    }
    return total;
  }
}
