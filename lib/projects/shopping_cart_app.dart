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
      final index = cart.indexWhere((item) =>
          item.product.name ==
          product.name); // returns index if found or -1 if not found
      if (index != -1) {
        cart[index].quantity++;
      } else {
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
    return cart.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                      trailing: IconButton(
                          onPressed: () => addToCart(product),
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.green,
                          )),
                    );
                  })),
          Divider(),
          Text(
            "Shopping Cart",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart[index];
                    return ListTile(
                      title: Text(
                          "${cartItem.product.name} (x${cartItem.quantity})"),
                      subtitle: Text(
                          "\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}"),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(cartItem),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  })),
          Divider(), //////
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Total: \$${calculateTotal().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
