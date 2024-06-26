import 'package:commerceapp/Model/cartcontroller.dart';
import 'package:commerceapp/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:commerceapp/Model/product.dart'; // Import your product model

class CartPage extends StatelessWidget {
  final CartController cartController =
      Get.find(); // Get instance of CartController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() => cartController.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartController.cartItems[index];
                      return ListTile(
                        leading: Image.network(
                          product.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.title),
                        subtitle: Text('\$${product.price.toString()}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cartController.removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total Amount: \$${cartController.getTotalAmount().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Proceed to Checkout'),
                ),
              ],
            )),
    );
  }
}
