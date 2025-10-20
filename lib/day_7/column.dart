import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_10/grid/gridview_builder.dart';
import 'package:ppkd_b4/day_12/state/state_1.dart';
import 'package:ppkd_b4/day_7/row.dart';

class ColumnWidgetDay7 extends StatefulWidget {
  const ColumnWidgetDay7({super.key});

  @override
  State<ColumnWidgetDay7> createState() => _ColumnWidgetDay7State();
}

class _ColumnWidgetDay7State extends State<ColumnWidgetDay7> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    RowWidgetDay7(),
    GridViewWidgetDay10(),
    State1Day12(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(title: Text("Column"), backgroundColor: Colors.blue),
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
      body: _widgetOptions[_selectedIndex],

      // Column(
      //   // mainAxisAlignment: MainAxisAlignment.start, // start
      //   mainAxisAlignment: MainAxisAlignment.center, // center
      //   //mainAxisAlignment: MainAxisAlignment.spaceAround, // spaceAround
      //   //mainAxisAlignment: MainAxisAlignment.spaceBetween, // spaceBetween
      //   //mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceEvenly
      //   //mainAxisAlignment: MainAxisAlignment.end, // end
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text("Halo semuanya, saya lagi di Body"),
      //     Text("Saya juga disini di PPKD"),

      //     // Text("S"),
      //     // Text("A"),
      //   ],
      // ),
    );
  }
}
