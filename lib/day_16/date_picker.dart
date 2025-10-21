import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidgetDay16 extends StatefulWidget {
  const DatePickerWidgetDay16({super.key});

  @override
  State<DatePickerWidgetDay16> createState() => _DatePickerWidgetDay16State();
}

class _DatePickerWidgetDay16State extends State<DatePickerWidgetDay16> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("2025-02-31"),
        Text("31-02-2025"),
        Text(selectedPicked.toString()),
        Text(DateFormat('yyyy-MM-dd').format(selectedPicked!)),
        Text(DateFormat('dd-MM-yyyy').format(selectedPicked!)),
        Text(DateFormat('dd-MMM-yyyy').format(selectedPicked!)),
        Text(DateFormat('EEEE, MMMM-yyyy', "id_ID").format(selectedPicked!)),

        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedPicked = picked;
              });
            }
          },
          child: Text("Pilih Tanggal"),
        ),
      ],
    );
  }
}
