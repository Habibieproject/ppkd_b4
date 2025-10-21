import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_16/input_widget.dart';

class DrawerWidgetDay15 extends StatefulWidget {
  const DrawerWidgetDay15({super.key});

  @override
  State<DrawerWidgetDay15> createState() => _DrawerWidgetDay15State();
}

class _DrawerWidgetDay15State extends State<DrawerWidgetDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    InputWidgetDay16(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/habibie.jpg"),
              ),
              title: Text("Habibie"),
              subtitle: Text("Instruktur PPKD"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Input Widget"),
            ),
            Divider(),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
