import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {

  final TextEditingController _wieghtController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";


  void calculateBmi() {
    final String num1Text = _wieghtController.text;
    final String num2Text = _heightController.text;

    if(num1Text.isNotEmpty && num2Text.isNotEmpty) {
      final double weigh = double.tryParse(num1Text) ?? 0;
      final double hight = double.tryParse(num2Text) ?? 0;

      setState(() {
        _result = "The BMI is: ${weigh / hight}";
      });
    }else {
      _result = "Please enter valid numbers";
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calculator"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _wieghtController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter weigh",
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter height",
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: calculateBmi, 
              child: Text("BMI"),
            ),

            const SizedBox(height: 16),

            Text(
              "The BMI Is: $_result",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}