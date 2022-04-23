import 'dart:convert';

import 'package:cmp_app/utils/types.dart';

class Users {
  late String uid;
  late String name;
  late String lastName;
  late String email;
  late String phone;
  late Roles role;

  Users(
      {required this.uid,
      required this.name,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.role});

  factory Users.fromJson(Map<String, dynamic> responseData) {
    return Users(
        uid: responseData['uid'],
        name: responseData['name'],
        lastName: responseData['lastName'],
        email: responseData['email'],
        phone: responseData['phone'],
        role: Roles.values.byName(responseData['role']));
  }

  Map toJson() {
    return {
      'uid': uid,
      'name': name,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role.name,
    };
  }
}
