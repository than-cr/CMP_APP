import 'dart:convert';

import 'package:cmp_app/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class UserService {
  static const String _userReference = 'users/';
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  void addUser(Users user) {
    String referenceUrl = _userReference + user.uid;

    DatabaseReference _dbRef = _firebaseDatabase.ref(referenceUrl);
    _dbRef.set(user.toJson());
  }
}
