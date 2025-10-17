import 'package:flutter/material.dart';

class DryWidgetDay13 extends StatelessWidget {
  const DryWidgetDay13({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> text = ["Tambah", "Kurang", "Bagi", "Kali"];
    return Scaffold(
      appBar: AppBar(title: Text("Dry Widget")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(text[0]),
          buttonWidget(
            text: "Button 1",
            onPressed: () {
              print("Ini button 1");
            },
          ),
          titleWidget(text[1]),

          buttonWidget(
            text: "Button 2",
            onPressed: () {
              print("Ini button 2");
            },
          ),
          titleWidget(text[2]),

          buttonWidget(
            text: "Button 3",
            onPressed: () {
              print("Ini button 3");
            },
            backgroundColor: Colors.amber,
          ),
          titleWidget(text[3]),

          buttonWidget(
            text: "Button 4",
            onPressed: () {
              print("Ini button 4");
            },
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          //   onPressed: () {},
          //   child: Text("Button 2"),
          // ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          //   onPressed: () {},
          //   child: Text("Button 3"),
          // ),
        ],
      ),
    );
  }

  Text titleWidget(String data) {
    return Text(
      data,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  ElevatedButton buttonWidget({
    required String text,
    required void Function()? onPressed,
    Color? backgroundColor,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.green,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
