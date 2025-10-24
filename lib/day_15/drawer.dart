import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_16/input_widget.dart';
import 'package:ppkd_b4/day_17/listview_list.dart';
import 'package:ppkd_b4/day_17/listview_list_map.dart';
import 'package:ppkd_b4/day_17/listview_model.dart';
import 'package:ppkd_b4/day_18/login_screen_18.dart';
import 'package:ppkd_b4/day_19/view/create_student.dart';
import 'package:ppkd_b4/preferences/preference_handler.dart';

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
    ListviewListWidgetDay17(),
    ListviewListMapWidgetDay17(),
    ListviewListModelWidgetDay17(),
    CRWidgetDay19(),
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
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewList Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewListMap Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewModel Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.list),
              title: Text("CR DB Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreenDay18()),
                  (route) => false,
                );
              },
              leading: Icon(Icons.outbond),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
