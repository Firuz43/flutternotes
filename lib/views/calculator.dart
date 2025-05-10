import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TGG"),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "0",
                  style: TextStyle(fontSize: 30),
                  //////////sssssssss
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Text(
                    "AC",
                    style: TextStyle(fontSize: 24),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Text(
                    "+/-",
                    style: TextStyle(fontSize: 24),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Text(
                    "%",
                    style: TextStyle(fontSize: 24),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                ),
                Container(
                  height: 60, //sdsasssdsasdqwe
                  width: 60,
                  child: Center(
                      child: Text(
                    "/", //sd
                    style: TextStyle(fontSize: 24),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
