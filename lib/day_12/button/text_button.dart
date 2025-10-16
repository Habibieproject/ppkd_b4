import 'package:flutter/material.dart';

class TextButtonDay12 extends StatelessWidget {
  const TextButtonDay12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Button")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              // style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                print("Tekan sekali");
              },
              onLongPress: () {
                print("Tekan lama");
              },
              child: Text("Tekan Aku"),
            ),
          ),
        ],
      ),
    );
  }
}
