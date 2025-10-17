import 'package:flutter/material.dart';

class CardMusicWidget extends StatelessWidget {
  const CardMusicWidget({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.totalPlay,
  });
  final String title;
  final String image;
  final String subtitle;
  final String totalPlay;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        tileColor: Colors.grey[200],
        title: Text(title),
        leading: Image.asset(image),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.play_arrow), Text(totalPlay)],
        ),
      ),
    );
  }
}
