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
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}