// lib/day_19/services/student_firebase_service.dart
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppkd_b4/day_39/models/student_model.dart';

class StudentFirebaseService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> get _studentsRef =>
      firestore.collection('students');

  /// CREATE STUDENT (tambah siswa)
  static Future<StudentModelFirebase> createStudent(
    StudentModelFirebase student,
  ) async {
    // bikin dokumen baru dengan auto id
    final doc = _studentsRef.doc();

    // siapkan map untuk disimpan
    final data = {
      ...student.toMap(),
      'id': doc.id,
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    };

    // simpan ke Firestore
    await doc.set(data);
    log('data: $data');
    log('data doc id: ${doc.id}');
    // kembalikan model dengan id dokumen (kalau StudentModelFirebase support id String)
    // sesuaikan dengan konstruktor StudentModelFirebase kamu
    return StudentModelFirebase.fromMap({
      // 'id': doc.id, // pastikan fromMap bisa handle String
      ...data,
    });
  }

  /// READ ALL STUDENT (ambil semua siswa)
  static Future<List<StudentModelFirebase>> getAllStudent() async {
    final snap = await _studentsRef
        .orderBy('createdAt', descending: false)
        .get();

    final list = snap.docs.map((doc) {
      final data = doc.data();

      // gabung doc.id sebagai id ke map
      return StudentModelFirebase.fromMap({'id': doc.id, ...data});
    }).toList();

    return list;
  }

  static Stream<List<StudentModelFirebase>> streamAllStudent() {
    return _studentsRef.orderBy('createdAt', descending: false).snapshots().map(
      (snap) {
        return snap.docs.map((doc) {
          final data = doc.data();

          // pastikan id selalu ada
          data['id'] ??= doc.id;

          return StudentModelFirebase.fromMap(data);
        }).toList();
      },
    );
  }

  /// UPDATE STUDENT
  ///
  /// asumsi: di StudentModelFirebase sudah ada field `id` yang menyimpan docId Firestore
  static Future<void> updateStudent(StudentModelFirebase student) async {
    // ambil id dari model
    final dynamic rawId = (student
        .toMap()['id']); // atau student.id kalau ada field langsung

    if (rawId == null) {
      throw Exception('Student id tidak boleh null untuk update');
    }

    final String docId = rawId.toString();

    final data = {
      ...student.toMap(),
      'updatedAt': DateTime.now().toIso8601String(),
    };

    // jangan overwrite id dengan yang salah, biasanya docId sudah cukup
    // kalau mau, kamu bisa remove field 'id' di data sebelum update
    // data.remove('id');

    await _studentsRef.doc(docId).update(data);
  }

  /// DELETE STUDENT
  ///
  /// docId = id dokumen di Firestore
  static Future<void> deleteStudent(String docId) async {
    await _studentsRef.doc(docId).delete();
  }
}
