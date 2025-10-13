import 'package:flutter/material.dart';

class ExpandedWidgetDay9 extends StatelessWidget {
  const ExpandedWidgetDay9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage("assets/images/soekarno.jpg"),
                ),
              ),
            ),
          ),
          Expanded(flex: 2, child: Container(width: 200, color: Colors.green)),
          Row(
            children: [
              Expanded(child: Container(height: 100, color: Colors.blue)),
              Expanded(child: Container(height: 100, color: Colors.red)),
              Expanded(child: Container(height: 100, color: Colors.purple)),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(height: 100, color: Colors.black),
              ),
              Expanded(child: Container(height: 100, color: Colors.white)),
              Expanded(child: Container(height: 100, color: Colors.indigo)),
            ],
          ),
        ],
      ),
    );
  }
}
