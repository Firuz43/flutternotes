import 'package:flutter/material.dart';
import 'package:flutternotes/projects/models.dart';

class ShoppingPractice extends StatefulWidget {
  const ShoppingPractice({super.key});

  @override
  State<ShoppingPractice> createState() => _ShoppingPracticeState();
}

class _ShoppingPracticeState extends State<ShoppingPractice> {
  //first we have to make our data models
  final List<Product> producs = [
    Product("Macbook", 23.3),
    Product("Iphone", 44.3),
    Product("Airpods", 22.3)
  ];

  // shopping cart//
  final List<CartItem> cart = [];

  void addToCart(Product product) {
    setState(() {
      final index =
          cart.indexWhere((test) => test.product.name == product.name);

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
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: producs.length,
                  itemBuilder: (context, index) {
                    final product = producs[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                      trailing: IconButton(
                          onPressed: () => addToCart(product),
                          icon: Icon(
                            Icons.shopping_cart,
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
                        "\$${(cartItem.quantity * cartItem.product.price).toStringAsFixed(2)}"),
                    trailing: IconButton(
                        onPressed: () => removeFromCart(cartItem),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                }),
          ),
          Divider(), //
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "\$${calculateTotal().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
