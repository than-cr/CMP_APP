import 'dart:convert';

import 'package:cmp_app/models/user_model.dart';
import 'package:cmp_app/services/authentication_service.dart';
import 'package:cmp_app/utils/common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserService {
  static const String _userReference = 'users/';
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  void addUser(Users user) {
    String referenceUrl = _userReference + user.uid;

    DatabaseReference _dbRef = _firebaseDatabase.ref(referenceUrl);
    _dbRef.set(user.toJson());
  }

  Future<Users?> getUserData(BuildContext context) async {
    Users? user;
    try {
      User? loggedUser = context.read<AuthenticationService>().getLoggedUser();

      if (loggedUser == null) {
        throw Exception('User not found');
      }

      String userUid = loggedUser.uid;

      DatabaseReference _databaseRef =
          _firebaseDatabase.ref(_userReference + userUid);
      DatabaseEvent _databaseEvent = await _databaseRef.once();

      if (_databaseEvent.snapshot.value == null) {
        throw Exception('User data not found');
      }
      user =
          Users.fromJson(jsonDecode(jsonEncode(_databaseEvent.snapshot.value)));
    } catch (e) {
      // TODO : log error
      Common.showAlert(context, e.toString(), false);
    }

    return user;
  }
}
