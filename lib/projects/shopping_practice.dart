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


    return const Placeholder();
  }
}