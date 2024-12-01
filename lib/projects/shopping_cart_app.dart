import 'package:flutter/material.dart';
import 'package:flutternotes/projects/models.dart';

class ShoppingCartApp extends StatefulWidget {
  const ShoppingCartApp({super.key});

  @override
  State<ShoppingCartApp> createState() => _ShoppingCartAppState();
}

class _ShoppingCartAppState extends State<ShoppingCartApp> {

  //List of available products
  final List<Product> products = [
    Product("Apple", 1.2),
    Product("Banana", 0.8),
    Product("Orange", 1.5),
    Product('Gpares', 2.0),
  ];

  //Shopping cart
  final List<CartItem> cart = [];

  void addToCart(Product product) {
    setState(() {
      final index = cart.indexWhere((item) => item.product.name == product.name);
      if(index != -1) {
        cart[index].quantity++;
      }else {
        cart.add(CartItem(product, 1));
      }
    });
  }

  void removeFromCart(CartItem cartItem) {
    setState(() {
      cart.remove(cartItem);
    });
  }

  double calculateTotal() {
    return cart.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
    );
  }
}