import 'package:flutter/material.dart';

class ListViewBuilderWidgetDay10 extends StatelessWidget {
  const ListViewBuilderWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12);
                },
                shrinkWrap: true,
                itemCount: 100,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/images/habibie.jpg"),
                  );
                },
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1000,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset("assets/images/soekarno.jpg"),
                      title: Text(
                        "soekarno17",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Jakarta Pusat, Indonesia",
                        style: TextStyle(fontSize: 10),
                      ),
                      trailing: Icon(Icons.more_horiz),
                    ),
                    Image.asset("assets/images/habibie.jpg"),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.favorite),
                          Icon(Icons.comment),
                          Icon(Icons.share),
                          Icon(Icons.share_location_sharp),
                        ],
                      ),
                    ),
                    // SizedBox(height: 12),
                    Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
