import 'package:flutter/material.dart';
import 'package:ppkd_b4/constant/app_color.dart';

class CheckBoxWidgetDay16 extends StatefulWidget {
  const CheckBoxWidgetDay16({super.key});

  @override
  State<CheckBoxWidgetDay16> createState() => _CheckBoxWidgetDay16State();
}

class _CheckBoxWidgetDay16State extends State<CheckBoxWidgetDay16> {
  bool isChecked = false;
  bool isShower = false;
  bool isBreakfast = false;
  bool isHappy = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                print(value);
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text("Apakah anda setuju dengan pernyataan diatas?"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                print(value);
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(
              isChecked
                  ? "Anda setuju dengan pernyataan diatas?"
                  : "Apakah anda setuju dengan pernyataan diatas?",
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.army3),
          onPressed: isChecked ? () {} : null,
          child: Text("Login"),
        ),

        CheckboxListTile(
          value: isShower,
          onChanged: (value) {
            print(value);
            setState(() {
              isShower = value!;
            });
          },
          title: Text("Apakah anda sudah mandi hari ini?"),
        ),
        CheckboxListTile(
          value: isBreakfast,
          onChanged: (value) {
            print(value);
            setState(() {
              isBreakfast = value!;
            });
          },
          title: Text("Apakah anda sarapan hari ini?"),
        ),
        CheckboxListTile(
          value: isHappy,
          onChanged: (value) {
            print(value);
            setState(() {
              isHappy = value!;
            });
          },
          title: Text("Apakah anda senang hari ini?"),
          activeColor: Colors.black,
        ),
      ],
    );
  }
}
