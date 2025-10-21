import 'package:flutter/material.dart';

class TimePickerWidgetDay16 extends StatefulWidget {
  const TimePickerWidgetDay16({super.key});

  @override
  State<TimePickerWidgetDay16> createState() => _TimePickerWidgetDay16State();
}

class _TimePickerWidgetDay16State extends State<TimePickerWidgetDay16> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Jam"),
        ),
      ],
    );
  }
}
