import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_16/checkbox.dart';
import 'package:ppkd_b4/day_16/date_picker.dart';
import 'package:ppkd_b4/day_16/dropdown.dart';
import 'package:ppkd_b4/day_16/switch.dart';
import 'package:ppkd_b4/day_16/time_picker.dart';

class InputWidgetDay16 extends StatelessWidget {
  const InputWidgetDay16({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //CheckBox
          Text("CheckBox"),
          CheckBoxWidgetDay16(),
          Divider(),
          Text("Switch"),
          SwitchWidgetDay16(),
          Divider(),
          Text("Dropdown"),
          DropdownWidgetDay16(),
          Divider(),
          Text("Date Time"),
          DatePickerWidgetDay16(),
          Divider(),
          Text("Time"),
          TimePickerWidgetDay16(),
        ],
      ),
    );
  }
}
