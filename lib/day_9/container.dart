import 'package:flutter/material.dart';

class ContainerWidgetDay9 extends StatelessWidget {
  const ContainerWidgetDay9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container")),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.all(12),
            // clipBehavior: Clip.antiAlias,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: AssetImage("assets/images/habibie.jpg"),
              ),
              // backgroundBlendMode: BlendMode.color,
            ),
            child: Text(
              "Halo, saya Habibie",
              style: TextStyle(fontSize: 30, color: Colors.orange),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue, Colors.green],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 24),
                    Text("Mobile Programming", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.private_connectivity_sharp, size: 200),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 12),
                    Text("15", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue, Colors.green],
              ),
              shape: BoxShape.circle,
            ),
            child: Text("20", style: TextStyle(fontSize: 40)),
          ),
        ],
      ),
    );
  }
}
