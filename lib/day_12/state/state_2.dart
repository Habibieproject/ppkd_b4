import 'package:flutter/material.dart';

class State2Day12 extends StatefulWidget {
  const State2Day12({super.key});

  @override
  State<State2Day12> createState() => _State2Day12State();
}

class _State2Day12State extends State<State2Day12> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State 2 Text Show")),
      body: Column(
        children: [
          // if (showImage)
          //   Image.asset(
          //     "assets/images/habibie.jpg",
          //     height: 400,
          //     width: double.infinity,
          //   ),
          if (showImage) ...[
            Image.asset(
              "assets/images/habibie.jpg",
              height: 400,
              width: double.infinity,
            ),
          ] else ...[
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text(
                  "Ciie ga tampil",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ],

          TextButton(
            onPressed: () {
              print("Tampilkan gambar : $showImage");
              showImage = !showImage;
              setState(() {});
            },
            child: Text(showImage ? "Sembunyikan" : "Tampilkan"),
          ),

          IconButton(
            onPressed: () {
              print("Tampilkan gambar : $showImage");
              showImage = !showImage;
              setState(() {});
            },
            icon: Icon(
              showImage ? Icons.visibility_off : Icons.visibility,
              color: showImage ? Colors.red : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
