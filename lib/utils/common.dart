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
}
