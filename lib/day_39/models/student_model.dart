import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentModelFirebase {
  String? id;
  String name;
  String email;
  String classs;
  int age;
  StudentModelFirebase({
    this.id,
    required this.name,
    required this.email,
    required this.classs,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'class': classs,
      'age': age,
    };
  }

  factory StudentModelFirebase.fromMap(Map<String, dynamic> map) {
    return StudentModelFirebase(
      id: map['id']?.toString(),
      name: map['name'] as String,
      email: map['email'] as String,
      classs: map['class'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModelFirebase.fromJson(String source) =>
      StudentModelFirebase.fromMap(json.decode(source) as Map<String, dynamic>);
}
