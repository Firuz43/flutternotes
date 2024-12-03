import 'package:flutter/material.dart';
import 'package:flutternotes/projects/models.dart';

class ShoppingPractice extends StatefulWidget {
  const ShoppingPractice({super.key});

  @override
  State<ShoppingPractice> createState() => _ShoppingPracticeState();
}

class _ShoppingPracticeState extends State<ShoppingPractice> {
  @override
  Widget build(BuildContext context) {
    
    //first we have to make our data models
    final List<Product> producs = [
      Product("Macbook", 23.3),
      Product("Iphone", 44.3),
      Product("Airpods", 22.3)
    ];

    // shopping cart
    final List<CartItem> cart = [];


    void addToCart(Product product) {
      setState(() {
        final index = cart.indexWhere((test) => test.product.name == product.name);

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

    return const Placeholder();
  }
}