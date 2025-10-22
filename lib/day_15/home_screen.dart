import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_10/stack.dart';
import 'package:ppkd_b4/day_12/state/state_2.dart';
import 'package:ppkd_b4/day_7/column.dart';

class HomeScreenDay15 extends StatelessWidget {
  const HomeScreenDay15({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        // automaticallyImplyLeading: false,
        // leading: Icon(Icons.home),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Login"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColumnWidgetDay7()),
                );
              },
              child: Text("Go To Day 7"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => State2Day12()),
                );
              },
              child: Text("Go To Day 12"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StackWidgetDay10()),
                  (route) => false,
                );
              },
              child: Text("Go To Day 10"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => BottomNavCustomDay15(),
                //   ),
                // );
              },
              child: Text("Go To BotNav Custom"),
            ),
          ),
        ],
      ),
    );
  }
}
