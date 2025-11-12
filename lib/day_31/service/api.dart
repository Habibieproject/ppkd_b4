import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b4/day_31/models/user_models.dart';

Future<List<User>> fetchUser() async {
  final response = await http.get(
    Uri.parse("https://reqres.in/api/users?page=2"),
    headers: {"x-api-key": "reqres-free-v1"},
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["data"];
    return userJson.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load user");
  }
}
