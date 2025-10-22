import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b4/constant/app_color.dart';
import 'package:ppkd_b4/day_10/grid/gridview_builder.dart';
import 'package:ppkd_b4/day_15/drawer.dart';
import 'package:ppkd_b4/day_15/home_screen.dart';

class BottomNavCustomDay15 extends StatefulWidget {
  const BottomNavCustomDay15({super.key, required this.email});
  final String email;
  @override
  State<BottomNavCustomDay15> createState() => _BottomNavCustomDay15State();
}

class _BottomNavCustomDay15State extends State<BottomNavCustomDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    HomeScreenDay15(),
    GridViewWidgetDay10(),
    DrawerWidgetDay15(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.email)),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColor.primaryColor,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
