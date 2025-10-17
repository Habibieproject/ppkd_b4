import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_13/reusable/music_widget.dart';

class ReusableOneWidgetDay13 extends StatelessWidget {
  const ReusableOneWidgetDay13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reusable One")),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return CardMusicWidget(
            image: "assets/images/habibie.jpg",
            subtitle: "Pascal Hee",
            title: "Echoes of Eternity",
            totalPlay: "5490",
          );
        },
      ),
    );
  }
}
