import 'package:flutter/material.dart';

class ListviewListWidgetDay17 extends StatefulWidget {
  const ListviewListWidgetDay17({super.key});

  @override
  State<ListviewListWidgetDay17> createState() =>
      _ListviewListWidgetDay17State();
}

class _ListviewListWidgetDay17State extends State<ListviewListWidgetDay17> {
  final List<String> namaBuah = ["Mangga", "Apel", "Jeruk", "Durian", "Pisang"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaBuah.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(namaBuah[index]));
      },
    );
  }
}
