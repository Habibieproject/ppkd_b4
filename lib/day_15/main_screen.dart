import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_10/grid/gridview_builder.dart';
import 'package:ppkd_b4/day_12/state/state_1.dart';
import 'package:ppkd_b4/day_15/home_screen.dart';

class BottomNavDay15 extends StatefulWidget {
  const BottomNavDay15({super.key});

  @override
  State<BottomNavDay15> createState() => _BottomNavDay15State();
}

class _BottomNavDay15State extends State<BottomNavDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    HomeScreenDay15(),
    GridViewWidgetDay10(),
    State1Day12(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
