import 'package:flutter/material.dart';

class PaddingWidgetDay9 extends StatelessWidget {
  const PaddingWidgetDay9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Padding")),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        // padding: const EdgeInsets.symmetric(horizontal: 40),
        // padding: const EdgeInsets.symmetric(vertical: 40),
        // padding: const EdgeInsets.only(left: 50, right: 20),
        child: Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Halo, saya Habibie", style: TextStyle(fontSize: 30)),
                SizedBox(height: 24),
                Text(
                  "Instruktur PPKD Jakpus, Indonesia",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_city),
                    SizedBox(width: 24),
                    Text("Jakarta Pusat", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
