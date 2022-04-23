import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Common {
  static void showAlert(BuildContext context, String message, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: success
          ? Theme.of(context).primaryColor
          : Theme.of(context).errorColor,
    ));
  }

  Future<Map<String, dynamic>?> getCurrentUserClaims() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return null;
    }

    final idTokenResult = await user.getIdTokenResult(true);

    return idTokenResult.claims;
  }
}
