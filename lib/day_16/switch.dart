import 'package:flutter/material.dart';

class SwitchWidgetDay16 extends StatefulWidget {
  const SwitchWidgetDay16({super.key});

  @override
  State<SwitchWidgetDay16> createState() => _SwitchWidgetDay16State();
}

class _SwitchWidgetDay16State extends State<SwitchWidgetDay16> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
        Text(isSwitched ? "On" : "Off"),
        Container(
          height: 100,
          width: double.infinity,
          color: isSwitched ? Colors.black : Colors.amber,
        ),
      ],
    );
  }
}
