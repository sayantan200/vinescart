import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class DatabaseService {
  static Future<void> init() async {
    await _db.settings;
  }
}
