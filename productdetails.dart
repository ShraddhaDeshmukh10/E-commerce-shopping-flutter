import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:commerceapp/Model/product.dart'; // Import your product model

import 'Model/cartcontroller.dart'; // Import your cart controller

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final CartController cartController =
      Get.put(CartController()); // Get instance of CartController

  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(product.category,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Image.network(product.image, height: 200, width: 200),
            SizedBox(height: 20),
            Text(product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('\$${product.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Center(
                child:
                    Text(product.description, style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
