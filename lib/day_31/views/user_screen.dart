import 'package:flutter/material.dart';
import 'package:ppkd_b4/day_31/models/user_models.dart';
import 'package:ppkd_b4/day_31/service/api.dart';

class Day31UserScreen extends StatefulWidget {
  const Day31UserScreen({super.key});

  @override
  State<Day31UserScreen> createState() => _Day31UserScreenState();
}

class _Day31UserScreenState extends State<Day31UserScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final user = snapshot.data as List<User>;
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) {
              final dataUser = user[index];
              return ListTile(
                title: Text("${dataUser.firstName} ${dataUser.lastName}"),
                subtitle: Text("${dataUser.email}"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(dataUser.avatar!),
                ),
              );
            },
          );
        } else {
          return Text("Gagal Memuat Data");
        }
      },
    );
  }
}
