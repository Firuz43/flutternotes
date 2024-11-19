import 'package:flutter/material.dart';

class Simplecalc extends StatefulWidget {
  const Simplecalc({super.key});

  @override
  State<Simplecalc> createState() => _SimplecalcState();
}

class _SimplecalcState extends State<Simplecalc> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = "";

  void _addNumbers() {
    final String num1Text = _num1Controller.text;
    final String num2Text = _num2Controller.text;

    if(num1Text.isNotEmpty && num2Text.isNotEmpty) {
      final double num1 = double.tryParse(num1Text) ?? 0;
      final double num2 = double.tryParse(num2Text) ?? 0;

      setState(() {
        _result = "Result: ${num1 + num2}";
      });
    }else {
      setState(() {
        _result = "Please enter valid numbers.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}