import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_b4/constant/app_image.dart';
import 'package:ppkd_b4/day_39/models/student_model.dart';
import 'package:ppkd_b4/day_39/service/student_firebase.dart';
import 'package:ppkd_b4/widgets/login_button.dart';

class CRWidgetDay40Firebase extends StatefulWidget {
  const CRWidgetDay40Firebase({super.key});

  @override
  State<CRWidgetDay40Firebase> createState() => _CRWidgetDay40FirebaseState();
}

class _CRWidgetDay40FirebaseState extends State<CRWidgetDay40Firebase> {
  final nameC = TextEditingController();
  final ageC = TextEditingController();
  final emailC = TextEditingController();
  final classC = TextEditingController();

  // cuma buat trigger rebuild, future tetap di FutureBuilder
  getData() {
    // DbHelper.getAllStudent();
    StudentFirebaseService.getAllStudent();
    setState(() {});
  }

  Future<void> _onEdit(StudentModelFirebase student) async {
    final editNameC = TextEditingController(text: student.name);
    final editAgeC = TextEditingController(text: student.age.toString());
    final editClasssC = TextEditingController(text: student.classs);
    final editEmailC = TextEditingController(text: student.email);

    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              buildTextField(hintText: "Name", controller: editNameC),
              buildTextField(hintText: "Email", controller: editEmailC),
              buildTextField(hintText: "Age", controller: editAgeC),
              buildTextField(hintText: "Classs", controller: editClasssC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = StudentModelFirebase(
        id: student.id.toString(),
        name: editNameC.text,
        email: editEmailC.text,
        classs: editClasssC.text,
        age: int.parse(editAgeC.text),
      );

      // OLD: DbHelper.updateStudent(updated);
      await StudentFirebaseService.updateStudent(updated);

      getData();
      Fluttertoast.showToast(msg: "Data berhasil di update");
    }
  }

  Future<void> _onDelete(StudentModelFirebase student) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${student.name}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Jangan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus aja"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      // OLD: DbHelper.deleteStudent(student.id!);
      // kalau id Firestore itu String docId:
      await StudentFirebaseService.deleteStudent(student.id.toString());

      getData();
      Fluttertoast.showToast(msg: "Data berhasil di hapus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Text("Pendaftaran Siswa", style: TextStyle(fontSize: 24)),
            buildTextField(hintText: "Name", controller: nameC),
            buildTextField(hintText: "Age", controller: ageC),
            buildTextField(hintText: "Class", controller: classC),
            buildTextField(hintText: "Email", controller: emailC),
            LoginButton(
              text: "Tambahkan",
              onPressed: () {
                if (nameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nama belum diisi");
                } else if (emailC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Email belum diisi");
                } else if (classC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Class belum diisi");
                } else if (ageC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Age belum diisi");
                } else {
                  final StudentModelFirebase dataStudent = StudentModelFirebase(
                    name: nameC.text,
                    email: emailC.text,
                    classs: classC.text,
                    age: int.parse(ageC.text),
                  );

                  // OLD: DbHelper.createStudent(dataStudent)
                  StudentFirebaseService.createStudent(dataStudent).then((
                    value,
                  ) {
                    emailC.clear();
                    ageC.clear();
                    classC.clear();
                    nameC.clear();
                    getData();
                    Fluttertoast.showToast(msg: "Data berhasil ditambahkan");
                  });
                }
              },
            ),
            SizedBox(height: 30),

            // FutureBuilder(
            //   // OLD: future: DbHelper.getAllStudent(),
            //   future: StudentFirebaseService.getAllStudent(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return CircularProgressIndicator();
            //     } else if (snapshot.data == null || snapshot.data.isEmpty) {
            //       return Column(
            //         children: [
            //           Image.asset(AppImages.empty, height: 150),
            //           Text("Data belum ada"),
            //         ],
            //       );
            //     } else {
            //       final data = snapshot.data as List<StudentModelFirebase>;
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: data.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             final items = data[index];
            //             return Column(
            //               children: [
            //                 ListTile(
            //                   title: Text(items.name),
            //                   subtitle: Text(items.email),
            //                   trailing: Row(
            //                     mainAxisSize: MainAxisSize.min,
            //                     children: [
            //                       IconButton(
            //                         onPressed: () {
            //                           _onEdit(items);
            //                         },
            //                         icon: Icon(Icons.edit),
            //                       ),
            //                       IconButton(
            //                         onPressed: () {
            //                           _onDelete(items);
            //                         },
            //                         icon: Icon(Icons.delete, color: Colors.red),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             );
            //           },
            //         ),
            //       );
            //     }
            //   },
            // ),
            StreamBuilder<List<StudentModelFirebase>>(
              // ⬅️ ganti FutureBuilder
              stream:
                  StudentFirebaseService.streamAllStudent(), // ⬅️ ganti future:
              builder:
                  (
                    BuildContext context,
                    AsyncSnapshot<List<StudentModelFirebase>> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        !snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Column(
                        children: [
                          Image.asset(AppImages.empty, height: 150),
                          Text("Data belum ada"),
                        ],
                      );
                    } else {
                      final data = snapshot.data!;

                      return Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final items = data[index];
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(items.name),
                                  subtitle: Text(items.email),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _onEdit(items);
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _onDelete(items);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
