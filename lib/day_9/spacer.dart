import 'package:flutter/material.dart';

class SpacerWidgetDay9 extends StatelessWidget {
  const SpacerWidgetDay9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spacer")),
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
          Spacer(),
          Expanded(
            flex: 2,
            child: Container(
              width: 200,

              color: Colors.green,
              child: Center(
                child: Text(
                  "PRESIDEN",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(child: Container(height: 100, color: Colors.blue)),
              Spacer(),

              Expanded(child: Container(height: 100, color: Colors.red)),
              Spacer(),

              Expanded(child: Container(height: 100, color: Colors.purple)),
            ],
          ),
        ],
      ),
    );
  }
}
