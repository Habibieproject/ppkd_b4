import 'package:flutter/material.dart';

class ElevatedButtonDay12 extends StatelessWidget {
  const ElevatedButtonDay12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Elevated Button")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  print("Tekan sekali");
                },
                onLongPress: () {
                  print("Tekan lama");
                },
                child: Text("Tekan aku", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
