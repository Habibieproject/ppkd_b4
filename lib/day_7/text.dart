import 'package:flutter/material.dart';

class TextWidgetDay7 extends StatelessWidget {
  const TextWidgetDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gopay", style: TextStyle(fontSize: 75)),
          Text("Saldo", style: TextStyle(fontSize: 30, color: Colors.red)),
          Text(
            "Rp.1.000.000.000",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.amber,
            ),
          ),
          Text(
            "Baru Masuk Rp.100.000.000.000.000.000.000",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.amber,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
