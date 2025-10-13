import 'package:flutter/material.dart';

class SizedBoxWidgetDay9 extends StatelessWidget {
  const SizedBoxWidgetDay9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SizedBox")),
      body: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Halo, saya Habibie", style: TextStyle(fontSize: 30)),
            SizedBox(height: 24),
            Text("Instruktur PPKD", style: TextStyle(fontSize: 30)),
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
    );
  }
}
