import 'package:flutter/material.dart';

class IconButtonDay12 extends StatelessWidget {
  const IconButtonDay12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Icon Button")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              // style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                print("Tekan sekali");
              },
              onLongPress: () {
                print("Tekan lama");
              },
              icon: Icon(Icons.push_pin),
            ),
          ),
        ],
      ),
    );
  }
}
